-- Joe's FXScript Compiler.applescript
-- Joe's FXScript Compiler

--  Created by Joe Maller on 6/29/05.
--  Copyright 2005 __MyCompanyName__. All rights reserved.


global dmgLibrary


property preferredTypes : {"txt", "fxscript"}
property maxProgress : 100
property completedProgress : 0


(* used by the FCP ccrash detection and recovery routines *)
property loopcount : 0
property crashcount : 0
property startTime : missing value

property paused : false

property buildFolder : ""




property panelWIndow : missing value



on will finish launching theObject
	
	-- load external library:
	set dmgLibrary to load script file (((path to me from user domain) & "Contents:Resources:Scripts:" & "FXScript Disk Image Creator" & ".scpt") as text)
	
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
	
	if name of theObject is "PreviousBuildButton" then
		log "PreviousBuildButton woke from NIB"
		if fetchUserDefaults("LastBuildPath") is not "" then
			
			log "LastBuildPath is not empty"
			if dirExists(fetchUserDefaults("LastBuildPath")) then
				log "dir exists"
				set enabled of theObject to true
			end if
		end if
		
		set enabled of theObject to false
	end if
end awake from nib


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
				return showStatus("Please drop a single file", false)
			else
				showStatus("", true)
				
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
	
	if name of theObject is "idleButton" then
		doPausePanel()
	end if
	
	if name of theObject is "closer" then
		close panel (window of theObject) with result 1
	end if
	
	if name of theObject is "CreateDMGButton" then
		log " go do the DMG thing"
	end if
	
	if name of theObject is "fLib" then
		
		LogTester() of dmgLibrary
	end if
	
	
end clicked

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


on panel ended theObject with result withResult
	-- add handler for quitting, etc...
	log withResult
	set paused to false
end panel ended








(* two keystroke saving subroutines for working with User Defaults *)
on fetchUserDefaults(theKey)
	return contents of default entry theKey of user defaults
end fetchUserDefaults

on setUserDefaults(theKey, theValue)
	set contents of default entry theKey of user defaults to theValue
end setUserDefaults






on doCompile(fileList)
	set completedProgress to 0 -- reset progress bar for new iteration.
	
	set loopcount to 0
	set crashcount to 0
	set startTime to current date
	
	
	showStatus("Building Output folders", true)
	
	set outputFolders to {fetchUserDefaults("fullEncoded"), fetchUserDefaults("demoEncoded"), fetchUserDefaults("fullSourceCode"), fetchUserDefaults("demoSourceCode")} -- get folder names from user defaults.
	
	set outputFolders to makeFolders(outputFolders, fetchUserDefaults("outputFolderPath")) -- create folders and replace outputfolder with a list of records like: {|folderName|:, |fullPath|:}
	
	--	tell application "Finder" to log name of container of POSIX file (|fullPath| of item 1 of outputFolders)
	
	repeat with theFile in fileList -- from 1 to count of fileList
		
		showStatus("Compiling source code for: " & |fileName| of theFile, true)
		set completedProgress to completedProgress + 0.25 * (1 / (count of fileList))
		
		set fullplugSource to applyWatermark(|fullPath| of theFile, |fullPath| of item 3 of outputFolders, fetchUserDefaults("watermarkMenuString"), "")
		
		showStatus("Compiling demo source code for: " & |fileName| of theFile, true)
		set completedProgress to completedProgress + 0.25 * (1 / (count of fileList))
		
		log "waterMarkSource:" & fetchUserDefaults("waterMarkSource")
		set demoplugSource to applyWatermark(|fullPath| of theFile, |fullPath| of item 4 of outputFolders, fetchUserDefaults("watermarkMenuString"), fetchUserDefaults("waterMarkSource"))
		
		
		showStatus(|fileName| of theFile & ": Sending demo code to Final Cut Pro", true)
		set completedProgress to completedProgress + 0.25 * (1 / (count of fileList))
		
		
		FXBuilderSaveEncodedPlugin(demoplugSource, (text 1 thru -10 of |fileName| of theFile as string), |fullPath| of item 2 of outputFolders)
		
		showStatus(|fileName| of theFile & ": Sending full code to Final Cut Pro", true)
		set completedProgress to completedProgress + 0.25 * (1 / (count of fileList))
		
		FXBuilderSaveEncodedPlugin(fullplugSource, (text 1 thru -10 of |fileName| of theFile as string), |fullPath| of item 1 of outputFolders)
		
		
	end repeat
	
	
	-- check for "open on finished" checkbox
	tell me to activate
	
	log "
-- ==================
-- = Ending Compile =
-- ==================
"
	
	log outputFolders
	log |fullPath| of item 1 of outputFolders
	log |fullPath| of item 1 of outputFolders as string
	
	log buildFolder
	setUserDefaults("LastBuildPath", buildFolder)
	revealInFinder(|fullPath| of item 1 of outputFolders)
	
	set elapsedSeconds to ((current date) - startTime)
	log "Time elapsed: " & secondsToHMS(elapsedSeconds)
	log "Final Cut Pro crashed: " & crashcount & " times."
	showStatus("Elapsed Time: " & secondsToHMS(elapsedSeconds) & " crashes: " & crashcount, true)
	
end doCompile


on showStatus(theMessage, theStatus)
	
	log theMessage
	set contents of text field "statusMessage" of window "main" to theMessage
	return theStatus
end showStatus

on makeProgress(progressValue)
	set contents of progress indicator "theProgressBar" of window "main" to progressValue
end makeProgress





on isTextFile(theFile)
	-- checks a file for a known extension, a TEXT file type, and a type-id containing "text" returns true on any of those
	
	set theInfo to info for (POSIX file theFile)
	set theTypeID to type identifier of theInfo
	set theFileType to file type of theInfo
	set theExtension to name extension of theInfo
	
	
	if theFileType is "TEXT" then
		return true
	end if
	
	if theTypeID contains "text" then
		return true
	end if
	
	if theExtension is in preferredTypes then
		return true
	end if
	
	return false
end isTextFile


on resetFileList()
	
end resetFileList

on resetOutputFolders()
	log "resetting Output Folders"
	setUserDefaults("fullEncoded", "full")
	setUserDefaults("demoEncoded", "demo")
	setUserDefaults("fullSourceCode", "full code")
	setUserDefaults("demoSourceCode", "demo code")
	--	return true
end resetOutputFolders






on zeroPad(theVal, endLength)
	-- endLength is number of total digits to return
	repeat (endLength / 10 as integer) + 1 times -- add 10 zeros at a time
		copy "0000000000" & theVal to theVal
	end repeat
	
	return text (endLength * -1) thru -1 of theVal
end zeroPad



on getVersion(theFile)
	--	do shell script "cvs -d/usr/local/cvsrep status " & quoted form of theFile & " | awk '/Working/ {print $3}'"
	--do shell script "/usr/local/bin/./svn log  " & quoted form of theFile & " | grep -m1 -er[0-9] | awk '{print $1}'"
	
	return do shell script "/usr/local/bin/./svn log " & quoted form of theFile & " | grep -m1 -er[0-9] | awk '{print $1}'"
	
	
end getVersion




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
	
	log "
===========================
= NOW IN APPLYWATERMARK() =
===========================
"
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



on FCPdismissStartupWindows()
	log "FCPdismissStartupWindows()"
	set loopcount to loopcount + 1
	-- this checks for every startup window I can find, closes one then calls itself again until it returns true
	-- check for window "Offline Files"
	tell application "Final Cut Pro" to activate -- bring FCP to front
	
	tell application "System Events"
		tell process "Final Cut Pro"
			
			try
				with timeout of 30 seconds
					
					set windowList to name of every window
					(* FCP will occasionally fail to respond to System Events during launch and restoration of exising projects. I've never had a 5 minute wait, but who knows... *)
				end timeout
				
				if windowList contains "External A/V" then
					(key code 53) -- press escape
					my FCPdismissStartupWindows()
				end if
				
				if windowList contains "Offline Files" then
					click button "Continue" of window "Offline Files"
					my FCPdismissStartupWindows()
				end if
				
				if button "Replace" of window 1 exists then click button "Replace" of window 1
				
			on error the error_message number the error_number
				-- i don't think is is ever getting called...
				log "FAILED on: " & loopcount & ", " & error_number & " (" & error_number & ") retrying..."
				
				
				log loopcount
				if loopcount < 25 then my FCPdismissStartupWindows() -- loopcount is a check to prevent runaway loops
				
			end try
			
		end tell
	end tell
	return true
	
end FCPdismissStartupWindows




on FXBuilderBringToFront() -- makes sure frontmost window is FXBuilder
	log "FXBuilderBringToFront()"
	tell application "System Events"
		log "*** GETTING PROCESSES ***"
		log name of every process as list
		log "FCP EXISTS? " & (exists process "Final Cut Pro")
		
		if not (exists process "Final Cut Pro") then
			set crashcount to crashcount + 1
			my showStatus("FCP Crashed: Restarting...", true)
		end if
	end tell
	
	FCPdismissStartupWindows()
	
	tell application "System Events"
		tell process "Final Cut Pro"
			set windowList to name of every window
			if windowList contains "FXBuilder" then
				set FXBcount to 0
				repeat with theWindow in windowList
					if theWindow as string is "FXBuilder" then set FXBcount to FXBcount + 1
				end repeat
				
				repeat FXBcount times
					perform action "AXRaise" of window "FXBuilder"
					if scroll bar 1 of window "FXBuilder" exists then
						return true -- end, we found a workable window
					end if
					
					if size of window "FXBuilder" is {322, 320} then
						keystroke "w" using command down -- close preview window
					end if
					
					(* if there's a controls window, do nothing, which is a problem since it will remain frontmost
					this will fail gracefully however and eventually open a new FXBuilder window *)
					
				end repeat
			end if
			
			if value of attribute "AXEnabled" of menu item "FXBuilder" of menu "Tools" of menu bar 1 is false then
				log "FXBuilder menu disabled. loopcount: " & loopcount
				log "loopcount: " & loopcount
				if loopcount < 200 then my FCPdismissStartupWindows()
			end if
			click menu item "FXBuilder" of menu "Tools" of menu bar 1
		end tell
	end tell
	
end FXBuilderBringToFront


on FXBuilderPasteText(sourceText) -- places sourceText into an FXBuilder window
	
	FXBuilderBringToFront()
	set the clipboard to sourceText as text
	
	tell application "System Events"
		tell process "Final Cut Pro"
			tell application "Final Cut Pro" to activate
			keystroke "a" using command down -- select all
			key code 51 -- (delete key) delete current selected text
			keystroke "va" using command down -- paste and select all			
		end tell
	end tell
end FXBuilderPasteText


on FXBuilderSaveEncodedPlugin(plugSource, destName, destFolder)
	log "FXBuilderSaveEncodedPlugin(x, " & destName & ", " & destFolder & ")"
	-- need to have a catch for compile errors
	
	FXBuilderPasteText(plugSource) -- send source code to the FXBuilder window
	
	try
		tell application "Final Cut Pro" to activate
		tell application "System Events"
			tell process "Final Cut Pro"
				
				repeat 5 times -- check for gibberish in the save default box...
					with timeout of 10 seconds
						
						log "CLICKING CREATE ENCODED"
						click menu item "Create Encoded Plugin..." of menu "FXBuilder" of menu bar item "FXBuilder" of menu bar 1
						
						log "clicked, should be the save dialog"
					end timeout
					
					tell window "Save"
						
						if not (exists checkbox 2) then
							click checkbox 1 -- make sure hide extension is visible
							delay 1 -- let the interface catch up...
						end if
						
						if get value of checkbox 2 is 1 then -- checkbox 2 is the "Hide extension" option
							click checkbox 2 -- make sure hide extension is not checked
							delay 1 -- if the extension was hidden, wait one second for the UI to catch up with the script
						end if
						
						set theSaveExtensions to value of text field 1 as text
					end tell
					
					log theSaveExtensions
					log text -6 through -1 of theSaveExtensions
					log text -6 through -1 of theSaveExtensions is ".fcfcc"
					
					if text -6 through -1 of theSaveExtensions is ".fcfcc" then exit repeat -- clean default name, continue
					
					-- the existing text did not register correctly, so it probably contained crap characters
					key code 53 -- press escape to cancel save
					log "gibberish in save window"
					delay 1
					
				end repeat
			end tell
		end tell
		
		FXBuilderSetSaveDialogOutputFolder(destFolder)
		FXBuilderSetSaveDialogFileNameSaveFile(destName)
		--	tell application "System Events" to click button "Save" of window 1 of process "Final Cut Pro"
		
	on error the error_message number the error_number
		log "Error: " & the error_number & ". " & the error_message
		
		FXBuilderSaveEncodedPlugin(plugSource, destName, destFolder) -- call self if there's a fatal error
		
	end try
	
end FXBuilderSaveEncodedPlugin



on FXBuilderSetSaveDialogFileNameSaveFile(theFileName)
	log "FXBuilderSetSaveDialogFileName(" & theFileName & ")"
	-- used to simplify entering the outgoing filename when saving files
	
	tell application "System Events"
		tell process "Final Cut Pro"
			tell window 1
				set the clipboard to theFileName as text
				repeat 5 times -- safety max loop value
					tell application "Final Cut Pro" to activate
					keystroke "av" using {command down} -- select all, paste
					set checkVal to (value of text field 1 is equal to theFileName as text)
					set checkVal to (value of text field 1 as text)
					
					if checkVal is equal to (theFileName as text) then exit repeat
					
				end repeat
				
				click button "Save" -- click save
			end tell
		end tell
	end tell
end FXBuilderSetSaveDialogFileNameSaveFile

on FXBuilderSetSaveDialogOutputFolder(thePath)
	log "FXBuilderSetSaveDialogOutputFolder(" & thePath & ")"
	-- used to simplify entering the destination path when saving FXScripts
	-- assumes that the FXBuilder save dialog is already frontmost
	-- flashes twice because the path would occasionally be entered incorrectly, the second flash is a safety check
	-- added a safety max-loop value of 5 in case the folder doesn't exist or something else breaks
	
	if dirExists(thePath) then
		tell application "System Events"
			tell process "Final Cut Pro"
				tell window 1
					set the clipboard to thePath as text
					repeat 5 times -- safety max loop value
						tell application "Final Cut Pro" to activate
						keystroke "g" using {command down, shift down} -- Open path entry dialog
						keystroke "av" using {command down} -- select all, paste
						set checkVal to (value of text field 1 as text)
						keystroke return -- close path entry dialog
						if checkVal is equal to (thePath as text) then exit repeat
					end repeat
				end tell
			end tell
		end tell
	end if
end FXBuilderSetSaveDialogOutputFolder


on dirExists(thePath)
	(* a simple and fast test to see if a folder exists, path should be POSIX, doesn't need to end in a slash *)
	try
		log (do shell script "test -d " & quoted form of thePath)
		return true
	on error
		return false
	end try
	
end dirExists

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


