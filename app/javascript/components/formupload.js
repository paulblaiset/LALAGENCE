/* pour afficher le nom des fichiers sous l'icone après l'upload*/

function showFileName( event ) {
  if (this.files[0]) {
    const fileName = this.files[0].name;
    var newDiv = document.createElement("div");
    newDiv.className = "preview-name";
    var newContent = document.createTextNode(fileName);
    newDiv.appendChild(newContent);

    this.parentNode.appendChild(newDiv);
  }
}

function fileUpload() {
  document.querySelectorAll("input[type=file]").forEach((input) => {
    input.addEventListener( 'change', showFileName );
  })
}

export { fileUpload };
