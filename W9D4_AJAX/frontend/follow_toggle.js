
class FollowToggle{ // attached to every button;
    constructor($el){ // options hash: user-id etc extra info 
    // debugger
      this.$el = $el // button
      this.userId = $el.data('user-id') // comes from _form (data-*)
      this.followState = $el.data('initial-follow-state')
      this.render(); // method within this class;

      this.$el.on('click', (event) => {
            // passing button as the second argument will be placing a click handler on all the children elements;
            this.handleClick(event);
        })
    }

  render() {
    if(this.followState === "unfollowed"){
    //   debugger
        // this.$el.empty();
        this.$el.html("Follow!"); 
        // we left the button blank, so that we can "append" what we write here.
    }else{
        // this.$el.empty();
        this.$el.html("Unfollow!");
    }
  }

  handleClick(event){
    // debugger;
    // ajax triggers callbacks in order to prevent the whole page from re-rendering
    // to process small data asynchronously
    // what datatype does ajax fetch? --> promise.
    
    event.preventDefault(); // prevents from auto-refreshing the page aka submit the form;

      if(this.followState === "unfollowed"){

        //   debugger;
          $.ajax({ // why? -- to make it brief and to make it ASYNCH! b/c the page doesnt get refreshed!!
            method: 'POST',
            url: `/users/${this.userId}/follow`,
          }).then(() => { // once the ajax request has returned successfully;
            this.followState = "followed";
            this.render();
          })
      }else{
        //   debugger;
          $.ajax({ 
            // ajax is created with vanilla JS, which can complicate the codes (.catch is a vanilla JS method cf .fail jquery method);
            // $ in "$.ajax" turns an ajax request into a jequery request, and allows us to call jquery method on it (.render, .fail, etc.)
            method: 'DELETE',
            url: `/users/${this.userId}/follow`,
          }).then(() => { // returns another promise obj (promise makes things simplify the code visually);
              this.followState = "unfollowed";
              this.render();
          })
        // .fail() can also be chained at the end;
      }
  }

}


module.exports = FollowToggle;