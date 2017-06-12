$(document).ready(function(){
  $(".delete").on("click",function(e){
    e.preventDefault()
    var $row = $(this).parent().parent()
    var className = $row.attr("class")
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

  $("#add-comment").on("submit", function(e){
    e.preventDefault()
    var $form = $(this)
    var data = $form.serialize()
    var method = $form.attr("method")
    var url = $form.attr("action")
    $.ajax({
      method: method,
      url: url,
      data: data,
    })
    .done(function(response){
      $("#comment-container").prepend(response)
      $form.trigger('reset')
    })
  })
})
