 $(document).ready(function(){
  $("a").on('click', function(event) {
    if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
      $('html, body').stop().animate({
        'scrollTop': $(hash).offset().top-140
     }, 900, 'swing'
     );
    }
  });
});


