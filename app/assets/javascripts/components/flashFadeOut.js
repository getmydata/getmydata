$(document).ready(function(){
  setTimeout(function(){
    $('.alert').fadeOut("slow", function() { // When the flash alert is activated, it slowly fades out
      $(this).remove();
    })
  }, 3000); // Miliseconds it takes to fade out

});
