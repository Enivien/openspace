// app/javascript/components/banner.js
import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["offsite-meetings", "photo shoots", "workshops","dinner parties","coporate events","product launches"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
