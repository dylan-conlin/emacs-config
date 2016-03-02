tell application "iTerm"
	make new terminal
	tell the current terminal
		activate current session
		launch session "Default Session"
		tell the last session
		     	tell application "System Events"
			     tell process "iTerm"
			     	  keystroke "v" using command down
			     end tell
		  	end tell
		end tell
	end tell
end tell
