import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Tinder", "Facebook", "TicketSwap", "Booking.com", "Albert Heijn", "Le Wagon"],
    typeSpeed: 200,
    loop: true
  });
}

export { loadDynamicBannerText };
