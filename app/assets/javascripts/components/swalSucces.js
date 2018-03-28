$(".swal-succes-redirect").click(function(){
  swal({
    title: 'Requests send!',
    html: 'Thank you!',
    type: 'success',
    confirmButtonText: 'View my messages!'
  }).then(function () {
    window.location.href = "/users/id/messages";
    }, function (dismiss) {
    if (dismiss === 'cancel') {
      window.location.href = "/send-messages";
    }
  });
});

$(".swal-succes").click(function(){
  swal({
    title: 'Requests send!',
    html: 'Thank you!',
    type: 'success',
    confirmButtonText: 'View my messages!'
  })
});
