// Document ready function
$ ( document ).ready(function() {
  console.log("Ready to go");

  // $('.box:nth-child(2)').toggleClass('bright-back')
  // Make alternating rows colored orange
  $('.row:nth-child(even)').toggleClass('bright-back');

  // Make alternating columns colored black(ish)
  $('.box:nth-child(3)').toggleClass('dark-back');

// To make this interactive and into something I can click again to bring back, I'd need to write the jQuery function so that it sets opacity to 0 instead.
  $('.box').click(function(event){
    alert("You clicked a box!");
    $( this ).toggleClass('appear');
    // $( this ).fadeTo(500, 0);
  });
});
