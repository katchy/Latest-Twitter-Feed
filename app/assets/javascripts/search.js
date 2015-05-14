$(document).ready(function() {
  var submitButton = $("#submit-button");
  var inputField = $("#submit-username");
  var tweetsContainer = $("#tweets");
  var error = $("<div>").text("Sorry! Tweet not found!");

  console.log('doc ready!');
  submitButton.on("click", function(){
    event.preventDefault(); 
    console.log('getTweet clicked!');
    console.log(inputField);
    var username = inputField.val();

    $.ajax({
      url: "/api/tweets",
      data: { user: username },
      method: "GET",
      dataType: "json",
      success: function(data) {
        debugger;
        var tweet = $("<div>").text(data);
        tweetsContainer.prepend(tweet);
        alert("done")
      },
      error: function(xhr, code, error) {
        if (xhr.responseText == "") {
          tweetsContainer.prepend(error);
        }
      }
    });
  });
});
  

