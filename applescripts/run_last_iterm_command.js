// run this from command line with: 
// osascript -l JavaScript ~/.emacs.d/applescripts/run_last_iterm_command.js
var iterm = Application('Iterm');

iterm.activate()
iterm.write("ls -la")
// Application('SystemEvents')
// iterm.currentTerminal()

// iterm.terminals[0].currentSession().exec({command: "ls -la"})


// iterm.includeStandardAdditions = true

// iterm.activate();
// iterm.exec("ln -la")

// iterm.currentTerminal().currentSession().select().exec({command: "ln -ls"});



