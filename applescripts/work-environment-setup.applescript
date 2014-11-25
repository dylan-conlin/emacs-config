tell application "iTerm"
	make new terminal
	tell the current terminal
		activate current session
		
		launch session "Default Session"
		tell the last session
			write text "cd drive/sites/shortstack-designer;foreman start -f Procfile.dev"
		end tell
		
		
		launch session "Default Session"
		tell the last session
			write text "cd drive/sites/shortstack;foreman start -f Procfile.dev"
		end tell
		
		
		launch session "Default Session"
		tell the last session
			write text "cd drive/sites/shortstack-server;foreman start -f Procfile.dev"
		end tell
		
		
		launch session "Default Session"
		tell the last session
			write text "cd drive/sites/shortstack-designer;bundle exec guard -i"
		end tell

                launch session "Default Session"
		tell the last session
			write text "cd drive/sites/shortstack;spork"
		end tell
		
		launch session "Default Session"
		tell the last session
			write text "ssh -nNt -g -R :12818:0.0.0.0:3001 tunnlr3598@ssh1.tunnlr.com"
		end tell
		
	end tell
end tell