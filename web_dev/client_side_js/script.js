  console.log("Yes Igor! We've done it!")

  var photo2 = document.getElementsByTagName('img')[1];
  var submitButton = document.getElementsByClassName("submit")[0];
  //hide form after submit
  function hideForm (event){
    event.target.parentElement.hidden = true;
  }
  function submit(event){
    event.preventDefault();
  }
  function addTitle(event) {
    event.target.title = "Tom \& Jerry";
  }

  function changeBackground(event) {
    event.target.changeBackground()
  }
  photo2.addEventListener("load", addTitle);
  submitButton.addEventListener("click", submit)
  submitButton.addEventListener("click", hideForm);
