

function postLink () {
  var linkData = {
    link: {
      url: $('#link_url').val(),
      title: $('#link_title').val()
    }
  }

  $.ajax({
    type: 'POST',
    url: '/links',
    data: linkData
  }).done(function(newLink) {
    $('.links').prepend(newLink)
    $('#link_url').val(""),
    $('#link_title').val("")
  })
}




function bindSubmitListenerAndPostLink() {
  $("#new-link input[type='submit']").on("click", function(event) {
    event.preventDefault()
    postLink()
  })
}



$(document).ready(function() {
  bindSubmitListenerAndPostLink()
})
