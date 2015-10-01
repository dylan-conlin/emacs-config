// run this from command line with: 
// osascript -l JavaScript ~/.emacs.d/applescripts/start_work.js
currentApp = Application.currentApplication()
iterm = Application('iTerm')
iterm.includeStandardAdditions = true
iterm.displayAlert('wow')
