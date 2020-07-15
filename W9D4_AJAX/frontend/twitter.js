const FollowToggle = require('./follow_toggle.js');

$(function(){ // jquery .ready()
  $('button.follow-toggle').each((idx, button) => new FollowToggle($(button)));
    // turn the button argument into jquery obj by adding $

  // all the button(HTML tag) with the class of "follow-toggle"
  // each button has a new instance of the FollowToggle
})

