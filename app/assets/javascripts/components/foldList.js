// !!! Copy the headers array from company.rb model !!!

var headers = ["Living", "Energy", "News", "Bank", "Education"]

// !!! Copy the headers array from company.rb model !!!

var arrayLength = headers.length

for (var i = 0; i < arrayLength; i++) {
  header = headers[i].toLowerCase();

  $(`.header-${header}`).click(function () {

    $header = $(this);

    //getting the next element
    $content = $header.next();
    //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.

    for (var i = 0; i < arrayLength; i++) {
      headerNotSelect = headers[i].toLowerCase();
      if (($(`.header-${headerNotSelect}`)[0]) != (($header)[0])) {
        $(`.header-${headerNotSelect}`).next().slideUp(500, function () {});
      }
    }

    if (($content).is(':visible')) {
      $content.slideUp(500);
    } else {
      $content.slideDown(500);
    }

  });
}

if(window.location.href.includes("/companies?utf8")) {
  for (var i = 0; i < arrayLength; i++) {
  console.log(i);
  headerSearch = headers[i].toLowerCase();
  $(`.header-${headerSearch}`).next().slideDown(500);
  }
}
