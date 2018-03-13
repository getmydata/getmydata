$("#send-all-messages").click(function(){
  if(confirm("Send all messages?")){
    const forms = document.getElementsByClassName("total-forms");

    for (var i=0 ; i<forms.length ; i++){
      document.getElementById("click-message-form"+i).click();
    }
  }
  else{
    return false;
  }
});
