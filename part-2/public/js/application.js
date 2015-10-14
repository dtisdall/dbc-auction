$(document).ready(function() {
  $("#sidebar").on("click", "#new_post_link", function(e){
    e.preventDefault()
    $("#sidebar").load('/posts/new')
  })
  $("#sidebar").on("submit", "#post_form", function(e){
    e.preventDefault()
    $.post( "/posts", $( this ).serialize() ).done( function() {
      $("#sidebar").load('/res/button');
      $("#posts").load('/posts')
    })
  })
});
