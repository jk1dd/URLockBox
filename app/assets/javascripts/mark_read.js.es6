$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();

  var linkId = this.parentElement.getAttribute('data-link-id')

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: {link: { read: true }},
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.links div[data-link-id=${link.id}]`).find('.read-status').text("Read?: true");
  $(`.links div[data-link-id=${link.id}] .mark-as-read`).removeClass('mark-as-read').addClass("mark-as-unread");
  $(`.links div[data-link-id=${link.id}]`).find('.mark-as-unread').text("Mark as Unread");
  $(`.links div[data-link-id=${link.id}]`).css({"color":"red", "text-decoration":"line-through"});
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
