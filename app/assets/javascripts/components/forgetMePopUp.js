$("#forgetme").click(function(){
  event.preventDefault()
  swal({
    title: 'Removal request send!',
    html: 'Thank you!',
    type: 'success',
    confirmButtonText: 'Ok'
  }).then(function () {
    window.location.href = "#";
  }, function (dismiss) {
  // dismiss can be 'cancel', 'overlay',
  // 'close', and 'timer'
  if (dismiss === 'cancel') {
    window.location.href = "/send-messages";
  }
});
});
