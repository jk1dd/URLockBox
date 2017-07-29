$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
  $("body").on("click", ".mark-as-read", sendHotRead)

  $.ajax({
    type: "GET",
    url: "https://fathomless-basin-91014.herokuapp.com/api/v1/links",
    success: function(data) {}
  }).done(updateHotReads)
})

function markAsRead(e) {
  e.preventDefault();

  var linkId = this.parentElement.getAttribute('data-link-id')

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { link: { read: true } },
    success: function(link) {
      $(`.links div[data-link-id=${link.id}]`).find('.read-status').text("Read?: true");
        $(`.links div[data-link-id=${link.id}] .mark-as-read`).removeClass('mark-as-read').addClass("mark-as-unread");
        $(`.links div[data-link-id=${link.id}]`).find('.mark-as-unread').text("Mark as Unread");
        $(`.links div[data-link-id=${link.id}]`).css({"color":"red", "text-decoration":"line-through"}).removeClass('is-read');
    }
  })
    .fail(displayFailure);
}

function sendHotRead (e) {
  e.preventDefault();
  var linkUrl = this.parentElement.firstElementChild.textContent.split(' ')[1]
  $.ajax({
    type: "POST",
    url: "https://fathomless-basin-91014.herokuapp.com/api/v1/links",
    data: {link: {url: linkUrl}},
    success: function(data) {
      console.log(data)
    }
  }).done(updateHotReads)

}

function updateHotReads(hotLinksArray) {
  var linkList = hotLinksArray.map(function(link) {return link.url})
  $('.link').each(function(index, link){
    var cardUrl = link.firstElementChild.innerText.split(' ')[1]
    if (linkList.includes(cardUrl)) {
      $(link).find('.hot-stuff').remove()
      $(link).find('.title').prepend('<h4 class="hot-stuff">Hott</h4>')
    } else {
      $(link).find('.hot-stuff').remove()
    }
    if (linkList[0] === cardUrl) {
      $(link).find('.hot-stuff').text('Top!')
    }
  })
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
