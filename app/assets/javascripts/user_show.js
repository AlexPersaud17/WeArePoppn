$(document).ready(function(){
  $(".delete").on("click",function(e){
    e.preventDefault()
    var $row = $(this).parent().parent()
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

  $(".remove").on("click", function(e){
    e.preventDefault()
    var $row = $(this).parent().parent().parent()
    var url = $(this).parent().attr("action")
    $.ajax({
      method: "DELETE",
      url: url,
    })
    .done(function(response){
      $row.parent().parent().parent().append(response)
      $row.remove()

    })
  })
})
