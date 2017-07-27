$( document ).ready(function(){
  $("#filter-input").on("keyup", filterLinks)
})

function filterLinks() {
  var filterText = this.value.toLowerCase()
  var links = document.getElementsByClassName('link')

  var i;
  for(i = 0; i < links.length; i++) {
    var linkUrl = links[i].innerText.split("\n")[0].split(' ')[1]
    var linkTitle = links[i].innerText.split("\n")[2].split(' ')[1]
    var match = linkTitle.toLowerCase().indexOf(filterText) > -1  || linkUrl.toLowerCase().indexOf(filterText) > -1
    links[i].style.display = match ?  "" : "none"
  }

}
