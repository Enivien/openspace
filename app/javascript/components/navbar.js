function initUpdateNavbarOnScroll() {
  const body = document.querySelector('body');

  if(!body.classList.contains("home")) return;

  const navbar = document.querySelector('.navbar-wagon');
  navbar.classList.add('navbar-wagon-transparent');

  const banner = document.querySelector('.banner');

  window.addEventListener('scroll', () => {
    console.log(banner.clientHeight)
    if (window.scrollY >= banner.clientHeight) {
      navbar.classList.remove('navbar-wagon-transparent');
      // navbar.classList.add('navbar-wagon-link-white');
    } else {
      navbar.classList.add('navbar-wagon-transparent');
      // document.getElementById("logo").src = "assets/logo-white.svg";
      // navbar.classList.add('navbar-wagon-link-white');
    }
  });
}

export { initUpdateNavbarOnScroll };
