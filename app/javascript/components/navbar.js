/*Pour que la navbar devienne transparente en scrollant*/

function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  const banner = document.querySelector('.banner-home');
  const logoWhite = document.querySelector(".navbar-wagon-brand .logo-white")
  const logoGreen = document.querySelector(".navbar-wagon-brand .logo-green")
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= banner.offsetHeight) {
        navbar.classList.add('navbar-wagon-white');
        logoWhite.classList.add('hidden')
        logoGreen.classList.remove('hidden')
      } else {
        navbar.classList.remove('navbar-wagon-white');
        logoWhite.classList.remove('hidden')
        logoGreen.classList.add('hidden')
      }
    });
  }
}
export { initUpdateNavbarOnScroll };
