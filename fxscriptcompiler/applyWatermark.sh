#! /bin/sh


#set -xv
#exec 2>/dev/console



# f = source file to work with
# o = output folder this is where the build folder basename is pulled from
# b = the beta menu mark, a short text snippet to add to the displayed name of the FXScript effect, ie "[BETA]"
# w = watermark source file, this is the text-bugger add-on which is added to the end of the source file

while getopts ":f:o:m:w:b:" OPTS
do
  case "$OPTS" in
    f) filePath="$OPTARG";;
    o) outFolder="$OPTARG";;
    b) betaMark="$OPTARG";;
    w) watermarkSource="$OPTARG";;
  esac
done

# File revision number from Subversion:
VERS=`/usr/local/bin/./svn log --limit 1 -q --incremental "$filePath" |tail -n 1 | awk '{print $1}'`

# build folder:
BASE=`basename "$outFolder"`

# compile-time headers:
echo -e "//\t`date '+Compiled: %B %d, %Y %H:%M:%S'`"
echo -e "//\t$BASE ($VERS)\n"

# 
#	sed -E -e "s/(([Gg]enerator|[Ff]ilter|[Tt]ransition)[\t ]*\"[^\"]*)/\1 $betaMark/g" "$filePath" 
# add "|[Gg]roup" to the above pattern to add the $betamark to the group declaration as well



# check whether $watermarkSource exists and if so prepend $betaMark with "DEMO" 
if [ -e "$watermarkSource" ]
	then
	betaMark="DEMO $betaMark" # Add Demo to the menu tag. If $betaMark is empty, the tag will just say DEMO
fi

