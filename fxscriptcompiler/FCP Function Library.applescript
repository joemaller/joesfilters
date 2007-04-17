-- FCP Function Library.applescript
-- Joe's FXScript Compiler

--  Created by Joe Maller on 8/18/06.
--  Copyright 2006 __MyCompanyName__. All rights reserved.



(* used by the FCP ccrash detection and recovery routines *)
property loopcount : 0
property crashcount : 0
property errorCount : 0
property startTime : missing value

tell me to log "loaded FCP Functions"



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
					(* FCP will occasionally fail to respond to System Events during launch and restoration of exising projects. this can take a while *)
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
	log "FXBuilderSaveEncodedPlugin([source], " & destName & ", " & destFolder & ")"
	-- need to have a catch for compile errors
	
	--log "calling FXBuilderPasteText"
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
		set errorCount to errorCount + 1
		log "errorCount: " & errorCount
		if errorCount > 25 then return -- safety since it ran off the rails here
		
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
end FXBuilderSetSaveDialogOutputFolder

