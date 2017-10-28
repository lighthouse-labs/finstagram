To get started, we want to create a js folder in our public folder. Inside js, make a file called application.js. The path to the file should look like this: /public/js/application.js.

Now, we want to link to jQuery and our application.js file. In our layout.erb, at the top in the <head> tag, we want to insert this:

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/application.js"></script>

In our /views/posts/new.erb, sandwiched between our error <ul> and <form>, we're gonna have an image without a src value. Give it an id you'll be able to target later.
In
<!-- all our error code is still here -->
  <img src="" id="preview" />
<!-- all our form code is here too! -->

Next, we're going to write the javascript for the previewer in /js/application.js:

$(document).ready(function() {
    $("#photo_url").on("blur", function(event) {
        var photo_url = $(this).val();
        var preview = $("#preview");
        if (photo_url) {
            preview.attr("src", photo_url)
            preview.show();
        } else {
            preview.hide();
        }
    });
});


What it's saying at the very top is, when the document is ready, perform all this code. Starting off with $(function(){ // do something }); is the same as starting off with $(document).ready(function(){ // do something });.

Next, execute our plan of attack: First, we want to grab the text from the input field(which has the ID photo_url) once the user moves away from it, take that text and set it as the src attribute on our image(this is the one we added, with ID preview), and then show the image.

We found that in order to do this, we had to add an event listener, in this case on blur -- when the user clicks out of the input field (rather than on focus, which is when the user clicks into the input field), so that our code knows when to take the value of the input field. This way, we aren't just grabbing the value of the input field when it's empty to start.

We also added some of jQuery's nice animation features like fadeIn() to give a nice effect of the image appearing on the page. I definitely recommend checking out the jQuery site, and seeing everything that the library can do.
