$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".mark-as-read", hotRead)
})

function hotRead (e) {
  e.preventDefault();
  // debugger
  // var linkId = this.parentElement.getAttribute('data-link-id')
  var linkUrl = this.parentElement.firstElementChild.textContent.split(' ')[1]
  $.ajax({
    type: "POST",
    // url: "https://fathomless-basin-91014.herokuapp.com/api/v1/links",
    url: "http://localhost:3001/api/v1/links",
    data: {link: {url: linkUrl}},
    success: function() {}
  })
  // https://fathomless-basin-91014.herokuapp.com/

}

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
  $(`.links div[data-link-id=${link.id}]`).css({"color":"red", "text-decoration":"line-through"}).removeClass('is-read');
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
