import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Philips", "Albert Heijn", "Tomtom", "TicketSwap", "Le Wagon"],
    typeSpeed: 200,
    loop: true
  });
}

export { loadDynamicBannerText };
