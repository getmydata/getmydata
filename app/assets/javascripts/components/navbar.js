$(document).ready(function() {     // Transition effect for navbar
  $(window).scroll(function() {     // checks if window is scrolled more than 500px, adds/removes solid class
    if($(this).scrollTop() > 750) {
      $('.navbar-wagon-home').addClass('solid');
    }
    else {
      $('.navbar-wagon-home').removeClass('solid');
    }
  });
});
