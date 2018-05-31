function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  const banner = document.querySelector('.banner-home');
  const logo = document.querySelector(".navbar-wagon-brand")
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= banner.offsetHeight) {
        navbar.classList.add('navbar-wagon-white');
        logo.innerHTML = "<img height='15' src='/assets/logo.png'>";
      } else {
        navbar.classList.remove('navbar-wagon-white');
        logo.innerHTML = "<img height='15' src='/assets/logo_white.png'>";
      }
    });
  }
}
export { initUpdateNavbarOnScroll };
