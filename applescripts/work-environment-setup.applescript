tell application "iTerm"

	make new terminal
        
        -- setup paths where i'd like to start each server
	set designer   to "cd drive/sites/shortstack-designer;foreman start -f Procfile.dev; clear"
	set shortstack to "cd drive/sites/shortstack;foreman start -f Procfile.dev; clear"
	set server     to "cd drive/sites/shortstack-server;foreman start -f Procfile.dev; clear"
        set guard      to "cd drive/sites/shortstack-designer;bundle exec guard -i; clear"
	set spork      to "cd drive/sites/shortstack;spork; clear"
        set api        to "cd drive/sites/shortstack-api;foreman start -f Procfile.dev; clear;"
        set tunnlr     to "ssh -nNt -g -R :12818:0.0.0.0:3001 tunnlr3598@ssh1.tunnlr.com"
        
	tell the current terminal
		activate current session

		launch session "Default Session"
		tell the last session
			write text "echo -e \"\\033]6;1;bg;red;brightness;140\\a\";echo -e \"\\033]6;1;bg;green;brightness;225\\a\";echo -e \"\\033]6;1;bg;blue;brightness;140\\a\";" & designer 
                        delay 2
                        set name to "designer"
		end tell


		launch session "Default Session"
		tell the last session
                        write text "echo -e \"\\033]6;1;bg;red;brightness;225\\a\";echo -e \"\\033]6;1;bg;green;brightness;140\\a\";echo -e \"\\033]6;1;bg;blue;brightness;140\\a\"; " & shortstack
                        delay 2
                        set name to "shortstack"
		end tell


		launch session "Default Session"
		tell the last session
                        write text "echo -e \"\\033]6;1;bg;red;brightness;140\\a\";echo -e \"\\033]6;1;bg;green;brightness;225\\a\";echo -e \"\\033]6;1;bg;blue;brightness;225\\a\"; " & server
                        delay 2
			set name to "server"
		end tell


		launch session "Default Session"
		tell the last session
                        write text guard
                        delay 2
                        set name to "guard"
		end tell

                launch session "Default Session"
		tell the last session
		        write text spork
                        delay 2
                        set name to "spork"
		end tell

		launch session "Default Session"
		tell the last session
			write text api
                        delay 2
                        set name to "api"
		end tell

		launch session "Default Session"
		tell the last session
			write text tunnlr
                        delay 2
                        set name to "tunnlr"
		end tell

	end tell
end tell
