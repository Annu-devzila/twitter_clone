// app/assets/javascripts/tweets.js

$(document).on("click", ".delete-tweet", function(e) {
  e.preventDefault();
  var tweetId = $(this).data("tweet-id");
  var confirmation = confirm("Are you sure you want to delete this tweet?");
  if (confirmation) {
    $.ajax({
      url: "/tweets/" + tweetId,
      type: "DELETE",
      dataType: "json",
      success: function(response) {
        // Handle success, e.g., remove the tweet from the DOM
        alert("Tweet deleted successfully!");
        window.location.reload(); // Reload the page to reflect changes
      },
      error: function(xhr, status, error) {
        // Handle error
        console.error("Error deleting tweet:", error);
      }
    });
  }
});
