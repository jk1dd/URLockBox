$( document ).ready(function(){
  $("body").on("click", ".mark-as-unread", markAsUnread)
})

function markAsUnread(e) {
  e.preventDefault();

  var linkId = this.parentElement.getAttribute('data-link-id')

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { link: { read: false }},
  }).then(updateLinkStatus)
    .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.links div[data-link-id=${link.id}]`).find('.read-status').text("Read?: false");
  $(`.links div[data-link-id=${link.id}] .mark-as-unread`).removeClass('mark-as-unread').addClass("mark-as-read");
  $(`.links div[data-link-id=${link.id}]`).find('.mark-as-read').text("Mark as Read");
  $(`.links div[data-link-id=${link.id}]`).css({"color":"black", "text-decoration":"none"});
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
