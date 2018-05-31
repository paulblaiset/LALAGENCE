// écouter le click sur la class .button-label
function selectJob() {
  const labels = document.querySelectorAll('.button-label');
  // const pickup = document.querySelector('.button-label');
  // const shipping_input = document.getElementById('sock_shipping_method');

  labels.forEach((label) => {
    label.addEventListener('click', (event) => {
      const checkedAll = document.querySelectorAll('.checked');
      checkedAll.forEach((checked) => {
        checked.classList.remove('checked');
      })
      event.currentTarget.classList.toggle('checked');
      const value = event.currentTarget.innerText;
      document.getElementById('user_work_situation').value = value;
      // event.pickup.idList.toggle("#no-button:checked")
    });
  });
}

export { selectJob };
