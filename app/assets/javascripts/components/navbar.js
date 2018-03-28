$(document).ready(function() {     // Transition effect for navbar
  $(window).scroll(function() {
    if($(this).scrollTop() > 150) { // checks if window is scrolled more than 150px, adds/removes solid class
      $('.navbar-wagon-home').addClass('solid');
      $('.navbar-wagon-home').addClass('solid');
    }
    else {
      $('.navbar-wagon-home').removeClass('solid');
    }
  });
});
