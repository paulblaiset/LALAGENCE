

function showFileName( event ) {
  console.log(this.files[0].name);
  const fileName = this.files[0].name;

  var newDiv = document.createElement("div");
  newDiv.className = "preview-name";
  var newContent = document.createTextNode(fileName);
  newDiv.appendChild(newContent);

  this.parentNode.appendChild(newDiv);

}


document.querySelectorAll("input[type=file]").forEach((input) => {
  input.addEventListener( 'change', showFileName );
})
