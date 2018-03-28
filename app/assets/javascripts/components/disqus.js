if(window.location.href.includes("/companies/")) { // If the current windows has /companies/ included the code is executed. This is added so the disqus code is not unnecessarily executed on every page

var disqus_config = function () {
    this.page.url = '<%= request.original_url %>'; // Replace PAGE_URL with your page's canonical URL variable
    this.page.identifier = document.getElementById("company_name").dataset.identifier;
  };

  (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
    s.src = 'https://getmydata.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
  })();
}
