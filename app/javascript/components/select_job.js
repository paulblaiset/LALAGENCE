// écouter le click sur la class .button-label
function selectJob() {
  const labels = document.querySelectorAll('.button-label');
  const checked = document.querySelector('.checked');
  // const pickup = document.querySelector('.button-label');
  // const shipping_input = document.getElementById('sock_shipping_method');

  labels.forEach((label) => {
    console.log("select job")
    label.addEventListener('click', (event) => {
      if (checked == null) {
        event.currentTarget.classList.add('checked');
      } else {
        event.checked.classList.remove('checked')
        event.currentTarget.classList.add('checked');
      }
      const value = event.currentTarget.innerText;
      document.getElementById('user_work_situation').value = value;
      // event.pickup.idList.toggle("#no-button:checked")
    });
  });
}

export { selectJob };
