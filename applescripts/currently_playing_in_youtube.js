#!/usr/bin/env osascript -l JavaScript

chrome = Application('Google Chrome');
chrome.includeStandardAdditions = true;

var foreach = function(arr, fn) {
  [].forEach.call(arr, function(window) {
    fn(window);
  });
}

var nowPlaying = [];
foreach(chrome.windows, function(window){
  var tabs = window.tabs;
  foreach(tabs, function(tab){
    if (tab.name().match(/YouTube/)) {
      var nameArr = tab.name().split(' - ');
      nowPlaying.push(nameArr[0] + " - " + nameArr[1]);
    }
  })
})

if(nowPlaying[0]){
  console.log(nowPlaying[0]);
} else {
  // return nothing
}
