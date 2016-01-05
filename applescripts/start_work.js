// run this from command line with: 
// osascript -l JavaScript ~/.emacs.d/applescripts/start_work.js
app = Application('Reminders')
app.includeStandardAdditions = true
// app.say('Hello world')
// email = app.displayDialog('Please enter your email address', {
//     withTitle: 'Email',
//     defaultAnswer: 'your_email@site.com'
// }).textReturned

// console.log(email)
// console.log(email)
// console.log(email)

var reminder = app.Reminder({name:"test today at 5pm", body: "bodyyyy"}).make()

console.log(reminder)
// console.log(app.lists[0].reminders.whose({name: "stop by silver peak!!!"})[0].remindMeDate())

// for(i=0; i < app.reminders.length; i++){
//   app.new.reminder({name:"test", body: "bodyyyy"})
//   // if(!app.reminders[i].completed()){
//   //   console.log(app.reminders[i].name())
//   // }
  
// }
