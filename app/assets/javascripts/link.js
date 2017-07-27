

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
    data: linkData,
    success: function(data) {
      if(data.errors){
        $('#errors').append(data.errors)
      }
    }
  }).done(function(newLink) {
    $('.links').prepend(newLink)
    $('#link_url').val(""),
    $('#link_title').val("")
  })
}

function bindSubmitListenerAndPostLink() {
  $("#new-link input[type='submit']").on("click", function(event) {
    event.preventDefault()
    $('#errors').empty()
    postLink()
  })
}



$(document).ready(function() {
  bindSubmitListenerAndPostLink()
})
