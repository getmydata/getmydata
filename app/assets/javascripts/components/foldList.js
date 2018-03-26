// !!! Copy the headers array from company.rb model !!!

var headers = ["Living", "Energy", "News", "Bank", "Education"]


var arrayLength = headers.length

for (var i = 0; i < arrayLength; i++) {
  header = headers[i].toLowerCase();

  $(`.header-${header}`).click(function () {
    $header = $(this);
    //getting the next element
    $content = $header.next();
    //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
    $content.slideToggle(500, function () {
        //execute this after slideToggle is done
        //change text of header based on visibility of content div
      });

  });
}
