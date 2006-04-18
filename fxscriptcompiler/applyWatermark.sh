#! /bin/sh




# later change this to use named parameters or switches or whatever those little -n flags are in Unix

d=r123;
b="//\tbuild_20060418_1620";
#echo -e "\t//\tVersion: $d\n$b\n\t//\t"`date '+%B %d, %Y'` "\n\n" |


VERS=`/usr/local/bin/./svn log "$1" | grep -m1 -er[0-9] | awk '{print $1}'`
echo
echo $VERS



echo -e "//\tCompiled `date '+%B %d, %Y'`"
echo -e "//\tbuild_20060418_1620 ($VERS)"
echo


echo $0
echo $1

head "$1"

#tee '/Users/joe/Documents/Joe'\''s Filters Development/Builds/build_20060418_1620/full code/Joe'\''s Fade In-n-Out.fxscript'; 

#sed -e 's/\\([fF]ilter[\t ]*"[^"]*\\)"/\\1 [BETA]"/' -e 's/\\([Tt]ransition[\t ]*"[^"]*\\)"/\\1 [BETA]"/' -e 's/\\([Gg]enerator[\t ]*"[^"]*\\)"/\\1 [BETA]"/' '/Users/joe/Documents/Joe'\''s Filters Development/joesfilters-svn/joesfilters/Joe'\''s Filters/Joe'\''s Fade In-n-Out.fxscript' | 
#tee -a '/Users/joe/Documents/Joe'\''s Filters Development/Builds/build_20060418_1620/full code/Joe'\''s Fade In-n-Out.fxscript'; "



#/Users/joe/Documents/Joe\'s\ Filters\ Development/Builds/build_20060418_1620/full\ code/Joe\'s\ Fade\ In-n-Out.fxscript



