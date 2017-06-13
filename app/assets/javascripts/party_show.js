$(document).ready(function(){
  var animOver = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';

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
      $("#comment-container").find(".comment-panel").first().addClass("animated slideInDown").one(animOver, function(){
        $("#comment-container").find(".comment-panel").first().removeClass("animated slideInDown")
      })
      $form.trigger('reset')
    })
  })


  $("#edit-details").on("click", function(e){
    e.preventDefault()
    $(this).hide()
    $("#party-details").hide()
    $(".edit-party-form").show()
    $("#errors").remove()
  })

  $(".edit-party-form").on("submit", function(e){
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
      $(".edit-party-form").parent().prepend(response)
      $(".edit-party-form").hide()
      $("#party-details").show()
      $("#edit-details").show()
    })
  })

})
