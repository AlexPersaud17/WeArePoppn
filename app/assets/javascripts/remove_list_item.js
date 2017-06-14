$(document).ready(function(){
  $(".item-list-table").on("click", ".remove-user-item", function(e){
    e.preventDefault();
    var url = $(e.target).parent().attr("action")
    $.ajax({
      method: "delete",
      url: url
    }).done(function(res){
      $(e.target).parent().parent().parent().html(res)
    })
  })
})
