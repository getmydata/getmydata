$("#send-all-messages").click(function(){ // Execute when id #send-all-messages is clicked
  var forms = document.getElementsByClassName("total-forms"); // Get all the forms into an array
  for (var i=0 ; i<forms.length ; i++){ // Forms.length makes sure that the loop continues until the total amount of forms is met
    document.getElementById("click-message-form"+i).click(); // In the send_messages_card.html.erb the index of the form has been added to the submit button. With this code all submit buttons of the existing forms are clicked
  }

  event.preventDefault() // Prevent default redirection after form is submitted
  swal({  // Sweet alert with content
    title: 'Requests send!',
    html: 'Thank you!',
    type: 'success',
    confirmButtonText: 'View my messages!'
  }).then(function () {
    window.location.href = "/users/id/messages";  // After message is confirmed, user is redirected to /users/id/messages
    }, function (dismiss) {
    if (dismiss === 'cancel') {
      window.location.href = "/send-messages";  // If message is cancelled, user is redirected to send-messages
    }
  });
});
