-- progressLib.applescript
-- Joe's FXScript Compiler

--  Created by Joe Maller on 8/29/06.
--  Copyright 2006 Joe Maller Inc.. All rights reserved.


property inProgress : 0
property maxProgress : 1

on initialize(newMaxProgress)
	set maxProgress to newMaxProgress
	showIt(true)
	showStatus(" ") -- clumsy, should be dealt with better in showStatus()
	set inProgress to 0
	set maxProgress to 1
	makeProgress()
end initialize

on showIt(showState)
	if showState is true then
		set visible of window "ProgressPanel" to true
		set level of window "ProgressPanel" to 3
		set hides when deactivated of window "ProgressPanel" to false
	else
		set visible of window "ProgressPanel" to false
	end if
end showIt

on showStatus(theMessage)
	showIt(true)
	if theMessage is not in {"", null} then -- update status, otherwise leave it onscreen and advance progress
		set contents of text field "statusMessage" of window "main" to theMessage
		set contents of text field "ProgressStatus" of window "ProgressPanel" to theMessage
	end if
	advance()
end showStatus

on advance()
	set inProgress to inProgress + 1
	makeProgress()
end advance

on makeProgress()
	set contents of progress indicator "theProgressBar" of window "main" to inProgress / maxProgress
	set contents of progress indicator "ProgressBar" of window "ProgressPanel" to inProgress / maxProgress
end makeProgress

