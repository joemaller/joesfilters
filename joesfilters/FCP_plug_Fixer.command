#!/bin/sh

# This is a simple script which will set all files in the Joe's Filters folder to be FCP text files (TEXT/KeyG)


# Location of the SVN repository
SVN=file:///Users/joe/Documents/SVN/joesfilters
LOCALPATH="/Users/joe/Documents/Joe's Filters Development/Plugins/Joe's Filters"



# remove existing test plugins:
#rm -r /Users/joe/Documents/Joe\'s\ Filters\ Development/Plugins/Joe\'s\ Filters/
rm -r "$LOCALPATH"

# export a new set from SVN:
svn export $SVN/trunk/joesfilters/Joe\'s\ Filters "$LOCALPATH"

# set the Resource Fork so FCP will recognize them:
#/Developer/Tools/SetFile -t TEXT -c KeyG /Users/joe/Documents/Joe\'s\ Filters\ Development/Plugins/Joe\'s\ Filters/*
/Developer/Tools/SetFile -t TEXT -c KeyG "$LOCALPATH"/*

# touch the folder and its contents in the folder so they look nice
touch "$LOCALPATH"
touch "$LOCALPATH"/*
