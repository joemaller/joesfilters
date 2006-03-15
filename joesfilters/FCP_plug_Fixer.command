#!/bin/sh

# This is a simple script which will set all files in the Joe's Filters folder to be FCP text files (TEXT/KeyG)

# remove existing plugsin:
rm -r /Users/joe/Documents/Joe\'s\ Filters\ Development/Plugins/Joe\'s\ Filters/

# export a new set from SVN:
svn export file:///Users/joe/Documents/SVN/joesfilters/trunk/joesfilters/Joe\'s\ Filters /Users/joe/Documents/Joe\'s\ Filters\ Development/Plugins/Joe\'s\ Filters/

# set the Resource Fork so FCP will recognize them:
/Developer/Tools/SetFile -t TEXT -c KeyG /Users/joe/Documents/Joe\'s\ Filters\ Development/Plugins/Joe\'s\ Filters/*

# touch the folder so they look nice:
touch Joe\'s\ Filters
