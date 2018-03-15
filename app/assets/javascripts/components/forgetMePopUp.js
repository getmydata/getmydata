$("#remove-data").click(function(){
  event.preventDefault()
  swal({
    title: 'Removal request send!',
    html: 'Thank you!',
    type: 'success',
    confirmButtonText: 'Ok'
  }).then(function () {
    window.location.href = "/users/id/messages";
  }, function (dismiss) {
  // dismiss can be 'cancel', 'overlay',
  // 'close', and 'timer'
  if (dismiss === 'cancel') {
    window.location.href = "/users/id/messages";
  }
});
});
