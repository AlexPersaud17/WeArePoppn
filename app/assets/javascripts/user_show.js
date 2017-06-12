$(document).ready(function(){
  $(".delete").on("click",function(e){
    e.preventDefault()
    $row = $(this).parent().parent()
    className = $row.attr("class")
    var url = $(this).attr("href")
    $.ajax({
      method: "DELETE",
      url: url,
    })
    .done(function(response){
      $('.' + className).remove()
    })
  })
})
