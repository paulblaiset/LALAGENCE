function setFilenames() {
  const previews = document.querySelectorAll('.preview-name');

  previews.forEach((preview) => {
    preview.previousElementSibling.insertAdjacentHTML('beforeend', preview.outerHTML);
    preview.remove();
  });
}

export { setFilenames };
