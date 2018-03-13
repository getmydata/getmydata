$("#send-all-messages").click(function(){
  const forms = document.getElementsByClassName("total-forms");
    for (var i=0 ; i<forms.length ; i++){
      document.getElementById("click-message-form"+i).click();
    }

    event.preventDefault()
    swal({
  title: 'Requests send!',
  html: 'Thank you!',
  type: 'success',
  confirmButtonText: 'View my messages!'
}).then(function () {
  window.location.href = "/users/id/messages";
}, function (dismiss) {
  // dismiss can be 'cancel', 'overlay',
  // 'close', and 'timer'
  if (dismiss === 'cancel') {
    window.location.href = "/send-messages";
  }
  });
});
