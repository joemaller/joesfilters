-- (DONE) SVN Export to /tmp
-- (DONE) print PDF documentation from Safari
-- (DONE) hide extensions on readme and .weblocs
-- (DONE) create disk image
-- (DONE) setup window and icons on disk image

-- (DONE) icon and window positioning is working
-- (DONE) fix webloc files

-- (DONE) convert dmg to read-only (test without DropDMG to see if icons stick better)
-- set up Demo and Full builds

-- Continue moving this to a function so it can be called twice, once for demo, once for full 


(*

AS names for full and demo folders are found here:

fetchUserDefaults("fullEncoded")
fetchUserDefaults("demoEncoded")
*)


-- glom this onto the end of the compiler script...

-- toggle the display of the window to make sure it's saved, eject the disk then convert the dmg to RO for uploading (use DropDMG)




property SVNrepos : "file:///Users/joe/Documents/SVN/joesfilters/trunk/joesfilters"
property SVNdiskDir : "file:///Users/joe/Documents/SVN/joesfilters/trunk/disk images/Joe's Filters"

property tmpDMG : "/tmp/joes_filters_rw.dmg"
property tmpFolder : "/tmp/joes_filters_for_DMG/"
property outputDMG : "/Users/joe/Joes_Filters.dmg"

property makePDF : false

--property outputFolders: {{|folderName|:"demo", |fullPath|:"/Users/joe/Documents/Joe\'s\ Filters\ Development/Builds/build_20060704_1317/demo"},{|folderName|:"full", |fullPath|:"/Users/joe/Documents/Joe\'s\ Filters\ Development/Builds/build_20060704_1317/full"}}


on diskImageFromFolder(srcPath, outPath, volName)
	try
		(do shell script "hdiutil create -format UDRW -attach -srcfolder " & (quoted form of POSIX path of srcPath) & " -volname \"" & volName & "\" " & (quoted form of POSIX path of outPath) & " | awk '/\\/dev\\/[^\\t]*\\t[^\\t]*\\t\\/.*/ {gsub(/ *\\t[^\\t]*\\t/,\"\\n\");print}'")
		return {|mount point|:paragraph 1 of the result, volume:paragraph 2 of the result}
	on error the errMsg number the errNum
		log errNum & " : " & errMsg
	end try
end diskImageFromFolder


on printWebPagePDF(theURL)
	try
		tell application "Safari"
			
			open location theURL -- forces the new page into a new window
			
			delay 5 -- wait for loading to finish
			with timeout of 5 seconds
				print document 1 of window 1 with properties {target printer:"PDFWriter"} without print dialog
			end timeout
			
			close window 1 -- to leave Safari as it was
			delay 5 -- wait for printing to finish
			
		end tell
		
	on error the errMsg number the errNum
		log errNum & " : " & errMsg
	end try
end printWebPagePDF


on stripExtension(thePath)
	set theInfo to info for thePath
	if name extension of theInfo is missing value then
		return name of theInfo
	else
		return (characters 1 through ((count characters of name of theInfo) - (count characters of name extension of theInfo) - 1)) of name of theInfo as string
	end if
end stripExtension




on setupWindow(thePath)
	log thePath
	
	-- window size:
	set windowBounds to {50, 75, 585, 680}
	
	-- icon size:
	set iconSize to 72
	
	-- build list of icon placement records:
	set iconTemplate to {}
	
	set end of iconTemplate to {filename:"Joe's Filters", iconCoords:{115, 150}}
	set end of iconTemplate to {filename:"Install Final Cut Pro", iconCoords:{415, 100}}
	set end of iconTemplate to {filename:"Install Final Cut Express", iconCoords:{415, 225}}
	set end of iconTemplate to {filename:"Joe's Filters Beta", iconCoords:{190, 390}}
	set end of iconTemplate to {filename:"Joe's Filters Documentation.pdf", iconCoords:{340, 390}}
	set end of iconTemplate to {filename:"Joe's Filters Readme.rtf", iconCoords:{115, 500}}
	set end of iconTemplate to {filename:"Joe's Filters.webloc", iconCoords:{265, 500}}
	set end of iconTemplate to {filename:"FXScript Resources", iconCoords:{415, 500}}
	
	-- background image for the window
	set windowBackground to ".nvisible:background.jpg"
	
	tell application "Finder"
		activate
		set newWin to make new Finder window
		set target of newWin to thePath
		set current view of newWin to icon view
		set toolbar visible of newWin to false
		set statusbar visible of newWin to false
		set icon size of icon view options of newWin to iconSize
		set arrangement of icon view options of newWin to not arranged
		set shows item info of icon view options of newWin to false
		
		
		try -- kill any .DS_STORE files before sizing and positioning
			do shell script "rm " & quoted form of POSIX path of thePath & ".DS_STORE"
		end try
		tell newWin
			set bounds to windowBounds
			tell application "System Events" to tell process "Finder" to click button 2 of window 1
			tell application "System Events" to tell process "Finder" to click button 2 of window 1
			set arrangement of its icon view options to not arranged
			
			repeat with i from 1 to count iconTemplate
				if (its file (filename of item i of iconTemplate) exists) then
					set position of its file (filename of item i of iconTemplate) to (iconCoords of item i of iconTemplate)
				else if (its folder (filename of item i of iconTemplate) exists) then -- file doesn't exist, check for folder
					set position of its folder (filename of item i of iconTemplate) to (iconCoords of item i of iconTemplate)
				end if
			end repeat
			
			if thePath & windowBackground as text as alias exists then
				set background picture of its icon view options to thePath & windowBackground as text as alias
			end if
			
		end tell
		
		set theDelay to 0.25
		set waitTime to 0
		set ejectMe to false
		repeat while ejectMe is false
			delay theDelay
			set waitTime to waitTime + theDelay
			if (do shell script "[ -f " & quoted form of POSIX path of thePath & ".DS_STORE ]; echo $?") = "0" then set ejectMe to true
		end repeat
		log "waited " & waitTime & " seconds for .DS_STORE to be created."
		--		eject thePath
	end tell
end setupWindow




on DropDMGConvert(srcPath, destPath)
	-- DropDMG (thankfully) expects a POSIX path
	tell application "DropDMG"
		activate
		with timeout of 2 * 60 * 60 seconds -- allow 2 hours before AppleScript times out 
			return create image from path srcPath format zlib compressed Â
				destination (do shell script "dirname " & destPath) base name (do shell script "basename " & destPath) license agreement name Â
				"Joe's Filters License" with auto open and delete original
		end timeout
	end tell
end DropDMGConvert










on BuildDiskImage(srcFolder, outputFile)
	
	
	set tmpFolder to POSIX path of srcFolder
	
	
	--  SVN export of disk contents:
	do shell script "/usr/local/bin/svn export \"" & SVNdiskDir & "\" \"" & tmpFolder & "\" --force"
	
	--- DELETE BELOW BEFORE RELEASE
	do shell script "cp /Users/joe/Documents/Joe\\'s\\ Filters\\ Development/Builds/build_20060704_1317/demo/* " & tmpFolder & "Joe\\'s\\ Filters\\ Beta/"
	--- DELETE ABOVE BEFORE RELEASE
	
	
	try
		-- set original plugins to FCP text files:
		do shell script "/Developer/Tools/SetFile -a E -c KeyG -t TEXT " & tmpFolder & "Joe\\'s\\ Filters/*"
	on error the errMsg number the errNum
		log return & return & return & errNum & " : " & errMsg & return & return & return
	end try
	
	-- set type/creator of encoded plugins, also hide extensions
	do shell script "find -E " & tmpFolder & " -iregex '.*/Joe.s Filters (Demo|Beta)/J.*' -exec /Developer/Tools/SetFile -a E -c KeyG -t FCSC {} \\; -print"
	
	if makePDF is true then -- print documentation
		printWebPagePDF("http:joesfilters.com") -- change to the printing url later on
		do shell script "COPYME=`ls -tu /tmp/Joe_s* | head -n1`; cp /tmp/$COPYME " & tmpFolder & "/Joe\\'s\\ Filters\\ Documentation.pdf"
	end if
	
	-- hide extensions on readme and weblocs
	do shell script "find -E " & tmpFolder & " -iregex '.*\\.(webloc|rtf|pdf)$' -exec /Developer/Tools/SetFile -a E {} \\;"
	
	
	copy diskImageFromFolder(POSIX file tmpFolder, POSIX file tmpDMG, "Joe's Filters") to theDisk --returns (*mount point:/dev/disk2s2, volume:/Volumes/Joe's Filters*)
	log theDisk
	do shell script "bless --openfolder " & quoted form of volume of theDisk -- set the window to open when the disk is mounted
	setupWindow((POSIX file (volume of theDisk)) as alias)
	-- do eject here instead of in setUpWindow()
	do shell script "hdiutil detach " & |mount point| of theDisk
	
	--set outputFile to "/Users/joe/Joes_Filters.dmg"
	DropDMGConvert(tmpDMG, POSIX path of outputFile)
	
	--	tell application "Finder" to move outputFile as alias to alias "Joe's MacBook Pro HD:Users:joe:"
	
end BuildDiskImage





on preCleanUp(rwDMG, prevFolder, prevDMG)
	
	log "**** preCleanUP ***"
	log "*** rwDMG:" & rwDMG
	log "*** prevFolder: " & prevFolder
	log "*** prevDMG: " & prevDMG
	log "**** preCleanUP ***"
	
	-- clean up  before processing:
	tell application "Finder"
		-- move previous RW images to the trash (could probably just rm them now...)
		try
			move rwDMG to trash
		on error the errMsg number the errNum
			log errNum & " : " & errMsg
		end try
		
		try
			move prevFolder to trash
		on error the errMsg number the errNum
			log errNum & " : " & errMsg
		end try
		
		-- rename previous output dmgs to prevent conflicts
		try
			copy my stripExtension(prevDMG) to fileRoot -- strip text after last period in the filename
			copy POSIX path of (container of prevDMG as alias) to dirName
			copy name of prevDMG to basename
			copy name extension of prevDMG to fileExt
			try
				set name of prevDMG to (fileRoot & "-" & (count paragraphs of (do shell script "ls " & quoted form of POSIX path of dirName & fileRoot & "*." & fileExt)) & "." & fileExt as string)
			on error the errMsg number the errNum
				log errNum & " : " & errMsg
				set name of prevDMG to fileRoot & "-" & hours of (current date) & minutes of (current date) & seconds of (current date) & "." & fileExt
			end try
		on error the errMsg number the errNum
			log errNum & " : " & errMsg
		end try
	end tell
	
end preCleanUp


copy (current date) to startTime
preCleanUp(POSIX file tmpDMG, POSIX file tmpFolder, POSIX file outputDMG)
BuildDiskImage(POSIX file tmpFolder, POSIX file outputDMG)



copy "file:///Users/joe/Documents/SVN/joesfilters/trunk/disk images/Joe's Filters Demo" to SVNdiskDir
copy "/Users/joe/Joes_Filters_Demo.dmg" to outputDMG

preCleanUp(POSIX file tmpDMG, POSIX file tmpFolder, POSIX file outputDMG)

BuildDiskImage(POSIX file tmpFolder, POSIX file outputDMG)


log (current date) - startTime & " seconds"

tell me to activate




on LogTester()
	
	log "this was successfully called from the other script file"
end LogTester


