var countDownDate = new Date("May 30, 2018 00:00:00").getTime(); // Set the date we're counting down to

var x = setInterval(function() { // Update the count down every 1 second

  var now = new Date().getTime(); // Get todays date and time
  var distance = countDownDate - now; // Find the distance between now an the count down date

  var days = Math.floor(distance / (1000 * 60 * 60 * 24)); // Time calculations for days, hours, minutes and seconds
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  document.getElementById("demo").innerHTML = days + "d " + hours + "h " // Display the result in the element with id="demo"
  + minutes + "m " + seconds + "s ";

  if (distance < 0) { // If the count down is finished, write some text
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1000);
