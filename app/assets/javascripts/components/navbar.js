$(document).ready(function() {     // Transition effect for navbar
  $(window).scroll(function() {     // checks if window is scrolled more than 500px, adds/removes solid class
    if($(this).scrollTop() > 750) {
      $('.navbar-wagon-home').addClass('solid');
      $('.navbar-wagon-home .navbar-wagon-brand img').attr('src','assets/GetMyData-logo-dark.png');
    }
    else {
      $('.navbar-wagon-home').removeClass('solid');
      $('.navbar-wagon-home .navbar-wagon-brand img').attr('src','assets/Getmydata_logo_white.png');
    }
  });
});
