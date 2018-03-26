if(window.location.href == "https://www.getmydata.io/companies" || window.location.href.includes("/send-messages"))  {

function checkOffsetLeft() {
  if($('.btn-left').offset().top + $('.btn-left').height()
   >= $('#footer').offset().top - 100)
    $('.btn-left').css('position', 'absolute');
  if($(document).scrollTop() + window.innerHeight < $('#footer').offset().top)
      $('.btn-left').css('position', 'fixed'); // restore when you scroll up
  }
  $(document).scroll(function() {
    checkOffsetLeft();
  });

  function checkOffsetRight() {
    if($('.btn-right').offset().top + $('.btn-right').height()
     >= $('#footer').offset().top - 100)
      $('.btn-right').css('position', 'absolute');
    if($(document).scrollTop() + window.innerHeight < $('#footer').offset().top)
      $('.btn-right').css('position', 'fixed'); // restore when you scroll up
  }
  $(document).scroll(function() {
    checkOffsetRight();
  });

};
