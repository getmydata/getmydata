if (window.location.href.includes("how-does-it-work")) {

  var i = 1;
  $('.progress .circle').removeClass().addClass('circle');
  $('.progress .bar').removeClass().addClass('bar');

  $("#progress-step-forward").click(function(){
    $('.progress .circle:nth-of-type(' + i + ')').addClass('active');

    $('.progress .circle:nth-of-type(' + (i-1) + ')').removeClass('active').addClass('done');

    $('.progress .circle:nth-of-type(' + (i-1) + ') .label').html('&#10003;');

    $('.progress .bar:nth-of-type(' + (i-1) + ')').addClass('active');

    $('.progress .bar:nth-of-type(' + (i-2) + ')').removeClass('active').addClass('done');

    i++;

    if (i==0) {
      $('.progress .bar').removeClass().addClass('bar');
      $('.progress div.circle').removeClass().addClass('circle');
      i = 1;
    }

    if ($('#circle-select').is('.active')) {
      contentHTML = "<h3>Step 1</h3><h3>Select companies</h3><p>Select the companies you want to send a data request to.</p>"
      $( ".how-it-works-content" ).empty().append( contentHTML );

    } else if ($('#circle-check').is('.active')) {
      contentHTML = "<h3>Step 2</h3><h3>Check your messages</h3><p>Select the companies you want to send a data request to.</p>"
      $( ".how-it-works-content" ).empty().append( contentHTML );

    } else if ($('#circle-send').is('.active')) {
      contentHTML = "<h3>Step 3</h3><h3>Send your messages</h3><p>Select the companies you want to send a data request to.</p>"
      $( ".how-it-works-content" ).empty().append( contentHTML );

    } else if ($('#circle-finish').is('.active')) {
      contentHTML = "<h3>Step 4</h3><h3>Now we wait...</h3><p>You've now send a data request to the companies you've selected.<br><br>In the overview you can view the messages you've send<br>and the deadline before when you need to receive a reply.</p>"
      $( ".how-it-works-content" ).empty().append( contentHTML );

    } else if ($('#circle-finish').is('.done')) {
      contentHTML = "<h3>That's it!</h3><p>Click START to start and get your data!</p>"
      buttonHTML = "<a href='/companies'><div class='progress-bar-btn' id='progress-step-forward'><h3>Start</h3></div></a>"
      $( ".how-it-works-content" ).empty().append( contentHTML );
      $( ".how-it-works-btn" ).empty().append( buttonHTML );
    }

  });

// Need to implement backwards steps

$("#progress-step-back").click(function(){
  console.log("check");
  $('.progress .circle:nth-of-type(' + i + ')').addClass('active');

  $('.progress .circle:nth-of-type(' + (i-1) + ')').removeClass('active').addClass('done');

  $('.progress .circle:nth-of-type(' + (i-1) + ') .label').html('&#10003;');

  $('.progress .bar:nth-of-type(' + (i-1) + ')').addClass('active');

  $('.progress .bar:nth-of-type(' + (i-2) + ')').removeClass('active').addClass('done');

  i++;

  if (i==0) {
    $('.progress .bar').removeClass().addClass('bar');
    $('.progress div.circle').removeClass().addClass('circle');
    i = 1;
  }
});
}
