// ---- General fold list behaviour ----

var headers = ["Living", "Energy", "News", "Bank", "Education"]
var arrayLength = headers.length

for (var i = 0; i < arrayLength; i++) {
  header = headers[i].toLowerCase();
  $(`.header-${header}`).click(function () { // Iterate over all the various hadders and check whether they are clicked
    $header = $(this);
    $content = $header.next(); //Getting the next element. Open up the content needed - toggle the slide- if visible, slide up, if not slidedown.

    for (var i = 0; i < arrayLength; i++) { // This block below makes sure only one list is open at the same time
      headerNotSelect = headers[i].toLowerCase();
      if (($(`.header-${headerNotSelect}`)[0]) != (($header)[0])) { // Iterate over the array list again inside the main iteration. Check whether the header is equal to the clicked header. If the header is not equal to the clicked header, slide it up
        $(`.header-${headerNotSelect}`).next().slideUp(500, function () {});
      }
    }

    if (($content).is(':visible')) { // Used slideUp and slideDown instead of toggle to maintain control over actions. This codeblock acts like a toggle function for the slideUp and slideDown. If the header is clicked and the content is visible, slide the content up
      $content.slideUp(500);
    } else { // If the header is clicked and the content is not visible, slide the content down
      $content.slideDown(500);
    }
  });
}

if(window.location.href.includes("/companies?utf8")) { // This block slides everything down if search is executed. window.location check the current url. A search in changes the url to include ?utf8. Now the code below only works if a search has been executed.
  for (var i = 0; i < arrayLength; i++) {
    headerSearch = headers[i].toLowerCase();
    $(`.header-${headerSearch}`).next().slideDown(500); // Take all the headers (array of all categories at the top of this file). Next() returns the next sibling element and makes them slide open (slideDown)
  }
}
