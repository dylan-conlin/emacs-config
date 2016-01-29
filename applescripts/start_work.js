// run this from command line with: 
// osascript -l JavaScript ~/.emacs.d/applescripts/start_work.js
app = Application('Messages');

app.includeStandardAdditions = true

var recipient = 'a';
var buddies = app.buddies();

var buddyList = []
for (i=0; i < buddies.length; i++) {
  try {
    if( buddies[i].fullName().indexOf(recipient) !== -1) {
      console.log(buddies[i].id());
      console.log(buddies[i].service());
      console.log(buddies[i].name());
      console.log(buddies[i].handle());
      console.log(buddies[i].status());
      console.log(buddies[i].statusMessage());
      console.log(buddies[i].idleTime());
      console.log(buddies[i].capabilities());
      console.log(buddies[i].image());
      console.log(buddies[i].firstName());
      console.log(buddies[i].lastName());
      console.log(buddies[i].fullName());

      // buddyList.push(buddies[i]);
    }
  } catch(err) {
    // console.log(err);
  }
  
}



// app.say('Hello world')
// email = app.displayDialog('Please enter your email address', {
//     withTitle: 'Email',
//     defaultAnswer: 'your_email@site.com'
// }).textReturned

// console.log(email)
// console.log(email)
// console.log(email)

// var reminder = app.Reminder({name:"test today at 5pm", body: "bodyyyy"}).make()

// console.log(reminder)
// console.log(app.lists[0].reminders.whose({name: "stop by silver peak!!!"})[0].remindMeDate())

// for(i=0; i < app.reminders.length; i++){
//   app.new.reminder({name:"test", body: "bodyyyy"})
//   // if(!app.reminders[i].completed()){
//   //   console.log(app.reminders[i].name())
//   // }
  
// }
