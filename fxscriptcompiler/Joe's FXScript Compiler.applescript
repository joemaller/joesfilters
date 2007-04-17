-- Joe's FXScript Compiler.applescript
-- Joe's FXScript Compiler

--  Created by Joe Maller on 6/29/05.
--  Copyright 2005 __MyCompanyName__. All rights reserved.


global dmgLibrary
global FCPLibrary
global progressLib

property preferredTypes : {"txt", "fxscript"}
property maxProgress : 100
property completedProgress : 0

property paused : false

-- property buildFolder : ""

property panelWIndow : missing value


on will finish launching theObject
	-- load external library:
	set dmgLibrary to load script file (((path to me from user domain) & "Contents:Resources:Scripts:" & "FXScript Disk Image Creator" & ".scpt") as text)
	set FCPLibrary to load script file (((path to me from user domain) & "Contents:Resources:Scripts:" & "FCP Function Library" & ".scpt") as text)
	set progressLib to load script file (((path to me from user domain) & "Contents:Resources:Scripts:" & "progressLib" & ".scpt") as text)
	
	log "dmgLibrary's outputDMG: " & dmgLibrary's outputDMG
	
	
	
	set fileList to {}
	set end of fileList to {|fullPath|:"/boogle/joe.gtml"}
	set end of fileList to {|fullPath|:"blah/joe"}
	call method "setValue:forKey:" with parameters {fileList, "srcFileList"}
	
	(*	
	set theText to call method "valueForKey:" with parameter "srcFileList"
	log "result of valueForKey:srcFileList: "
	log theText
*)
	--	set outputFolders to {|fullEncoded|:"full", |demoEncoded|:"demo", |fullSourceCode|:"full code", |demoSourceCode|:"demo code"} -- these are the output folder names
	
	--	call method "setValue:forKey:" with parameters {fileList, "outputFolderNames"}
	
	(* OUTPUT FOLDER PREFERENCES *)
	make new default entry at end of default entries of user defaults with properties {name:"fullEncoded", contents:"full"}
	make new default entry at end of default entries of user defaults with properties {name:"demoEncoded", contents:"demo"}
	make new default entry at end of default entries of user defaults with properties {name:"fullSourceCode", contents:"fullcode"}
	make new default entry at end of default entries of user defaults with properties {name:"demoSourceCode", contents:"demo code"}
	
	(* empty list for source files *)
	make new default entry at end of default entries of user defaults with properties {name:"srcFileList", contents:{}}
	
	(* Watermark  *)
	make new default entry at end of default entries of user defaults with properties {name:"watermarkChooseFilePath", contents:"~"}
	make new default entry at end of default entries of user defaults with properties {name:"waterMarkSource", contents:""} -- watermark source file path
	make new default entry at end of default entries of user defaults with properties {name:"waterMarkText", contents:""} -- watermark source code
	
	(* output folder path *)
	make new default entry at end of default entries of user defaults with properties {name:"outputFolderPath", contents:"~"}
	
	(* Subversion Repository *)
	make new default entry at end of default entries of user defaults with properties {name:"svnRepository", contents:"file:///Users/joe/Documents/SVN/joesfilters/trunk"}
	
	(* Location of the Last Build *)
	make new default entry at end of default entries of user defaults with properties {name:"LastBuildPath", contents:""}
	
	(* CreateDMGs option *)
	make new default entry at end of default entries of user defaults with properties {name:"createDMGs", contents:true}
	
	
end will finish launching


on awake from nib theObject
	
	
	if name of theObject is "watermarkView" then
		tell theObject to register drag types {"file names", "text"}
	end if
	
	if name of theObject is "fileListView" then
		--		set content of theObject to (contents of default entry "srcFileList" of user defaults as list)
		
		tell theObject to register drag types {"file names"}
	end if
	
	if name of theObject is "aPanel" then
		log "New Panel Loaded"
	end if
	
	if name of theObject is "openLastBuild" then
		log "openLastBuild woke from nib"
		if fetchUserDefaults("LastBuildPath") is not "" then
			
			log "LastBuildPath is not empty, checking if dirExists(" & fetchUserDefaults("LastBuildPath") & ")"
			if dirExists(fetchUserDefaults("LastBuildPath")) then
				log "dir exists: " & fetchUserDefaults("LastBuildPath")
				--	set enabled of theObject to true
				lastBuildEnableButtons(true)
			else
				log "dir does not exist: " & fetchUserDefaults("LastBuildPath") & ", disabling buttons"
				lastBuildEnableButtons(false)
				--	set enabled of theObject to false
				--	set enabled of button "createDMGsFromLastBuild" of window "main" to false
				--	set enabled of button "createDMGsFromLastBuild" of window "prefsPanel" to false
			end if
		end if
		
		--set enabled of theObject to false
	end if
end awake from nib


on lastBuildEnableButtons(buttonState)
	set enabled of button "createDMGsFromLastBuild" of window "main" to buttonState
	set enabled of button "createDMGsFromLastBuild" of drawer "prefsDrawer" of window "main" to buttonState
	set enabled of button "openLastBuild" of window "main" to buttonState
end lastBuildEnableButtons



on drop theObject drag info dragInfo
	set dataTypes to types of pasteboard of dragInfo
	set preferred type of pasteboard of dragInfo to "file names"
	
	if name of theObject is "fileListView" then
		--		log content of theObject
		if "file names" is in dataTypes then
			
			set theFiles to {}
			--	set fileList to {}
			
			-- Get the list of files from the pasteboard
			set theFiles to contents of pasteboard of dragInfo
			
			set fileList to contents of default entry "srcFileList" of user defaults as list -- load array from user defaults to populate array
			
			repeat with theItem in theFiles
				set end of fileList to {|fullPath|:theItem, |fileName|:name of (info for POSIX file theItem)}
			end repeat
			
			set contents of default entry "srcFileList" of user defaults to fileList
			
			return true
		end if
	end if
	
	if name of theObject is "watermarkView" then
		
		if "file names" is in dataTypes then
			
			-- Get the list of files from the pasteboard
			set theFiles to contents of pasteboard of dragInfo
			
			log (count of theFiles)
			if (count of theFiles) > 1 then
				return progressLib's showStatus("Please drop a single file", false)
			else
				progressLib's showStatus("", true)
				
			end if
			
			if isTextFile(item 1 of theFiles) then
				log item 1 of theFiles as text
				
				set theText to do shell script "cat " & (quoted form of item 1 of theFiles as text)
				-- use the cocoa whatever with file method to populate this instead of the shell script
				
				set contents of default entry "waterMarkText" of user defaults to theText
				
				return true
			end if
		end if
	end if
	set preferred type of pasteboard of dragInfo to "" --- restore preferred types
	return false
end drop



on clicked theObject
	log "clicked: " & name of theObject as text
	if name of theObject is "chooseFile" then
		tell open panel
			set can choose files to true
			set allows multiple selection to true
		end tell
		display open panel in directory fetchUserDefaults("watermarkChooseFilePath") with file name "SomeFile?" for file types {"txt", "css", "bin", "", "fxscript"}
		if the result is 1 then
			log path names of open panel as list
			setUserDefaults("watermarkChooseFilePath", directory of open panel)
			set theFiles to path names of open panel as list
			log theFiles
			set theText to do shell script "cat " & (quoted form of item 1 of theFiles as text)
			setUserDefaults("waterMarkSource", item 1 of theFiles) -- save watermark source path
			setUserDefaults("waterMarkText", theText) -- store watermark source text (possibly lose this)
		end if
	end if
	
	if name of theObject is "chooseOutputPath" then
		set theFolder to choose folder
		setUserDefaults("outputFolderPath", theFolder)
	end if
	
	if name of theObject is "compile" then
		doCompile(contents of default entry "srcFileList" of user defaults as list)
	end if
	
	if name of theObject is "resetSubfolderNames" then
		resetOutputFolders()
	end if
	
	if name of theObject is "pauseButton" then
		doPausePanel()
	end if
	
	if name of theObject is "closer" then
		-- this is the continue button...
		set paused to false
		close panel (window of theObject) with result 1
	end if
	
	if name of theObject is "CreateDMGButton" then
		log " go do the DMG thing"
	end if
	
	
	if name of theObject is "openLastBuild" then
		
		log (fetchUserDefaults("LastBuildPath"))
		--	log (fetchUserDefaults("outputFolderPath"))
		do shell script "open " & quoted form of (fetchUserDefaults("LastBuildPath"))
		
	end if
	
	if name of theObject is "createDMGsFromLastBuild" then
		log "go make DMGs"
		-- need to implement pre-cleanup
		set outputDMG to POSIX file (fetchUserDefaults("LastBuildPath") & "/Joes_Filters_Demo.dmg" as text)
		
		--		dmgLibrary's preCleanUp(POSIX file (dmgLibrary's tmpDMG), outputDMG)
		
		dmgLibrary's BuildDiskImage(outputDMG)
		
		--lastBuildEnableButtons(false)
	end if
	
	if name of theObject is "logger" then
		
		dmgLibrary's logger()
	end if
	
end clicked



(* two keystroke saving subroutines for working with User Defaults *)
on fetchUserDefaults(theKey)
	return contents of default entry theKey of user defaults
end fetchUserDefaults

on setUserDefaults(theKey, theValue)
	set contents of default entry theKey of user defaults to theValue
end setUserDefaults



on isTextFile(theFile)
	-- checks a file for a known extension, a TEXT file type, and a type-id containing "text" returns true on any of those
	
	set theInfo to info for (POSIX file theFile)
	
	set theTypeID to type identifier of theInfo
	set theFileType to file type of theInfo
	set theExtension to name extension of theInfo
	
	if theFileType is "TEXT" then return true
	if theTypeID contains "text" then return true
	if theExtension is in preferredTypes then return true
	
	return false
end isTextFile


on resetOutputFolders()
	setUserDefaults("fullEncoded", "full")
	setUserDefaults("demoEncoded", "demo")
	setUserDefaults("fullSourceCode", "full code")
	setUserDefaults("demoSourceCode", "demo code")
end resetOutputFolders


on doPausePanel() -- this shows the pause panel
	
	if panelWIndow is equal to missing value then
		load nib "panel"
		set panelWIndow to window "aPanel"
	end if
	
	
	set paused to true
	display panel panelWIndow attached to window "main"
	repeat while paused is true
		log "paused"
		delay 1
	end repeat
	
end doPausePanel










on doCompile(fileList)
	
	--	set progressLib's maxProgress to 5 + 4 * (count of fileList) -- four stages of progress on each file in filelist
	tell progressLib to initialize(5 + 4 * (count of fileList))
	progressLib's showStatus("Starting compile.")
	
	--	set completedProgress to 0 -- reset progress bar for new iteration.
	
	set loopcount to 0
	set crashcount to 0
	set startTime to current date
	
	set progressLib's maxProgress to 4 * (count of fileList) -- four stages of progress on each file in filelist
	
	progressLib's showStatus("Building Output folders")
	
	
	set outputFolders to {fetchUserDefaults("fullEncoded"), fetchUserDefaults("demoEncoded"), fetchUserDefaults("fullSourceCode"), fetchUserDefaults("demoSourceCode")} -- get folder names from user defaults.
	
	set outputFolders to makeFolders(outputFolders, fetchUserDefaults("outputFolderPath")) -- create folders and replace outputfolder with a list of records like: {|folderName|:, |fullPath|:}
	
	progressLib's showStatus("Output Folders completed")
	
	--	tell application "Finder" to log name of container of POSIX file (|fullPath| of item 1 of outputFolders)
	
	repeat with theFile in fileList -- from 1 to count of fileList
		
		progressLib's showStatus("Compiling source code for: " & |fileName| of theFile)
		--	set completedProgress to completedProgress + 0.25 * (1 / (count of fileList))
		--	progressLib's makeProgress(completedProgress)
		
		set fullplugSource to applyWatermark(|fullPath| of theFile, |fullPath| of item 3 of outputFolders, fetchUserDefaults("watermarkMenuString"), "")
		
		progressLib's showStatus("Compiling demo source code for: " & |fileName| of theFile, true)
		--	set completedProgress to completedProgress + 0.25 * (1 / (count of fileList))
		--	makeProgress(completedProgress)
		
		log "waterMarkSource:" & fetchUserDefaults("waterMarkSource")
		set demoplugSource to applyWatermark(|fullPath| of theFile, |fullPath| of item 4 of outputFolders, fetchUserDefaults("watermarkMenuString"), fetchUserDefaults("waterMarkSource"))
		
		
		progressLib's showStatus(|fileName| of theFile & ": Sending demo code to Final Cut Pro", true)
		--	set completedProgress to completedProgress + 0.25 * (1 / (count of fileList))
		--	makeProgress(completedProgress)
		
		
		FCPLibrary's FXBuilderSaveEncodedPlugin(demoplugSource, (text 1 thru -10 of |fileName| of theFile as string), |fullPath| of item 2 of outputFolders)
		
		progressLib's showStatus(|fileName| of theFile & ": Sending full code to Final Cut Pro", true)
		--	set completedProgress to completedProgress + 0.25 * (1 / (count of fileList))
		--	makeProgress(completedProgress)
		
		FCPLibrary's FXBuilderSaveEncodedPlugin(fullplugSource, (text 1 thru -10 of |fileName| of theFile as string), |fullPath| of item 1 of outputFolders)
		
		
	end repeat
	
	
	-- check for "open on finished" checkbox
	tell me to activate
	
	log "
-- ==================
-- = Ending Compile =
-- ==================
"
	
	progressLib's showStatus("Finished compiling, revealing build in Finder")
	--	makeProgress(1)
	
	--ShowProgressPanel(false)
	
	log outputFolders
	log |fullPath| of item 1 of outputFolders
	log |fullPath| of item 1 of outputFolders as string
	
	--	log "outputFolderPath" & fetchUserDefaults("outputFolderPath")
	--log "buildFolder: " & buildFolder
	log "setting LastBuildPath to: " & (do shell script "dirname " & quoted form of |fullPath| of item 1 of outputFolders)
	--(fetchUserDefaults("outputFolderPath") & "/" & fetchUserDefaults("LastBuildPath"))
	
	
	setUserDefaults("LastBuildPath", (do shell script "dirname " & quoted form of |fullPath| of item 1 of outputFolders))
	set enabled of button "openLastBuild" of window "main" to true
	revealInFinder(|fullPath| of item 1 of outputFolders)
	
	set elapsedSeconds to ((current date) - startTime)
	--	log "Time elapsed: " & secondsToHMS(elapsedSeconds)
	--	log "Final Cut Pro crashed: " & crashcount & " times."
	--	showStatus("Elapsed Time: " & secondsToHMS(elapsedSeconds) & " crashes: " & crashcount, true)
	progressLib's showStatus("Elapsed Time: " & secondsToHMS(elapsedSeconds) & " crashes: " & crashcount)
	progressLib's showIt(false)
	
end doCompile












on zeroPad(theVal, endLength)
	-- endLength is number of total digits to return
	repeat (endLength / 10 as integer) + 1 times -- add 10 zeros at a time
		copy "0000000000" & theVal to theVal
	end repeat
	
	return text (endLength * -1) thru -1 of theVal
end zeroPad




on makeFolders(outputFolderNames, outputFolderPath)
	
	(* Create Build folder *)
	set buildFolder to current date
	set buildFolder to "build_" & year of buildFolder & zeroPad(month of buildFolder as integer, 2) & zeroPad(day of buildFolder, 2) & "_" & zeroPad(hours of buildFolder, 2) & zeroPad(minutes of buildFolder, 2) -- create build folder name
	
	set outputFolders to {}
	set sh to "" -- initialize the shell script
	repeat with i in outputFolderNames
		set end of outputFolders to {|folderName|:i, |fullPath|:outputFolderPath & "/" & buildFolder & "/" & i}
		set sh to sh & "mkdir -p \"" & |fullPath| of last item of outputFolders & "\"; " -- THIS WILL FAIL ON NAMES WITH A DOUBLEQUOTE
	end repeat
	do shell script sh -- create the folders
	
	return outputFolders
end makeFolders





on applyWatermark(filePath, outFolder, betaMark, waterMarkSource)
	
	-- all input should be unescaped POSIX paths 
	-- there is nothing here to handle double-quotes in a file name, "quoted form of" wasn't working because AppleScript was adding an extra backslash
	
	log "applyWatermark(" & filePath & ", " & outFolder & ", " & betaMark & ", " & waterMarkSource & ")"
	
	tell main bundle
		set scriptPath to path for resource "applyWatermark" extension "sh"
	end tell
	
	set scriptPath to "\"" & scriptPath & "\""
	set outFile to (outFolder as text) & "/" & name of (info for (POSIX file filePath))
	set filePath to " -f\"" & filePath & "\""
	set outFolder to " -o\"" & outFolder & "\""
	set betaMark to " -b\"" & betaMark & "\""
	set waterMarkSource to " -w\"" & waterMarkSource & "\""
	
	log "scriptPath: " & scriptPath
	log "filePath" & filePath
	log "outFolder" & outFolder
	log "betaMark: " & betaMark
	log "waterMarkSource: " & waterMarkSource
	log "outFile: " & outFile
	
	set theScript to scriptPath & filePath & outFolder & betaMark & waterMarkSource & " | tee \"" & outFile & "\""
	log return & "theScript:" & return & theScript & return & return
	do shell script theScript
	
end applyWatermark




on revealInFinder(thePath)
	-- reveals a file in the Finder, takes a POSIX path as input
	
	tell application "Finder"
		--	activate
		open container of (POSIX file thePath as alias)
		select (POSIX file thePath as alias)
	end tell
	
end revealInFinder





on secondsToHMS(theSeconds)
	-- returns value of seconds in hours, minutes and seconds
	
	set theHours to theSeconds div 3600
	set theMinutes to theSeconds div 60 mod 60
	set theSeconds to theSeconds mod 60
	
	set outString to ""
	if theHours > 0 then
		set s to " "
		if theHours is not 1 then set s to "s "
		set outString to outString & theHours & " hour" & s
	end if
	if theMinutes > 0 then
		set s to " "
		if theMinutes is not 1 then set s to "s "
		set outString to outString & theMinutes & " minute" & s
	end if
	if theSeconds > 0 then
		set s to " "
		if theSeconds is not 1 then set s to "s"
		set outString to outString & theSeconds & " second" & s & "."
	end if
	return outString
end secondsToHMS




on dirExists(thePath)
	(* a simple and fast test to see if a folder exists, path should be POSIX, doesn't need to end in a slash *)
	try
		log (do shell script "test -d " & quoted form of thePath)
		return true
	on error
		return false
	end try
end dirExists








