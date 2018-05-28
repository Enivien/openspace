// app/javascript/components/banner.js
import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Open spaces for photoshootings.", "Open spaces for workshops.","Open spaces for conferences.","Open spaces for coporate parties.","Open spaces for productions."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
