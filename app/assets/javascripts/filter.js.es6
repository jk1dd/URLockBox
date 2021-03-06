$( document ).ready(function(){
  $("#filter-input").on("keyup", filterLinks)
  $("#filter-read").on("click", filterRead)
  $("#filter-unread").on("click", filterUnread)

})

function filterLinks() {
  var filterText = this.value.toLowerCase()
  var links = document.getElementsByClassName('link')

  var i;
  for(i = 0; i < links.length; i++) {
    var linkUrl = links[i].children[0].textContent.split(' ')[1]
    var linkTitle = links[i].children[1].textContent.split(':')[1]
    var match = linkTitle.toLowerCase().indexOf(filterText) > -1  || linkUrl.toLowerCase().indexOf(filterText) > -1
    links[i].style.display = match ?  "" : "none"
  }

}

function filterRead() {
  var links = document.getElementsByClassName('link')

  var i;
  for(i = 0; i < links.length; i++) {
    var readStatus = links[i].children[2].textContent.split(' ')[1]
    var match = readStatus.toLowerCase().indexOf('true') > -1
    links[i].style.display = match ? "" : "none"
  }
}

function filterUnread() {
  var links = document.getElementsByClassName('link')

  var i;
  for(i = 0; i < links.length; i++) {
    var readStatus = links[i].children[2].textContent.split(' ')[1]
    var match = readStatus.toLowerCase().indexOf('false') > -1
    links[i].style.display = match ? "" : "none"
  }
}
