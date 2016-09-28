window.addEventListener("load", function(event){
  console.log("Yes Igor! We've done it!")

  var photo2 = document.getElementsByTagName('img')[1];
  var submitButton = document.getElementsByClassName("submit")[0];
  //hide form after submit

  function submit(event){
    event.preventDefault();
    event.target.parentElement.hidden = true;
  }

  // photo2.addEventListener("load", addTitle);
  submitButton.addEventListener("click", submit)
})