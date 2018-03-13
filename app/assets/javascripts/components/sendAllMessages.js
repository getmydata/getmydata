$("#send-all-messages").click(function(){
  if(confirm("Send all messages?")){
    const forms = document.getElementsByClassName("total-forms");
    for (var i=0 ; i<forms.length ; i++){
      document.getElementById("click-message-form"+i).click();
    }

    event.preventDefault();

    setTimeout(function(){
      window.alert("Messages have been send");
      window.location.href = "/users/id/messages";
    }, 1000);


  }
  else{
    return false;
  }
});
