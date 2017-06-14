$(document).ready(function(){

  var animOver = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';

  $(".add-drinks-button").on("click", function(e){
    e.preventDefault();
    $(".add-drinks-form").addClass("animated slideInRight").one(animOver, function(){
      $(".add-drinks-form").removeClass("animated slideInRight")
    })
    $(".add-drinks-button").hide();
    $(".add-drinks-form").show();
    $(".add-drinks-form").trigger("reset");
  })

  $(".drinks-panel-heading").on("submit", ".add-drinks-form", function(e){
    e.preventDefault();
    var data = $(e.target).serialize()
    var url = $(e.target).attr("action")
    $.ajax({
      method: "post",
      data: data,
      url: url
    }).done(function(res){
      $(e.target).parent().siblings(".panel-body").children("table").prepend(res)
      $(".add-drinks-button").show();
      $(".add-drinks-form").hide();
    })
  })

  $(".add-dish-button").on("click", function(e){
    e.preventDefault();
    $(".add-dish-form").addClass("animated slideInRight").one(animOver, function(){
      $(".add-dish-form").removeClass("animated slideInRight")
    })
    $(".add-dish-form").show();
    $(".add-dish-form").trigger("reset");
    $(".add-dish-button").hide();
  })

  $(".dish-panel-heading").on("submit", ".add-dish-form", function(e){
    e.preventDefault();
    var data = $(e.target).serialize()
    var url = $(e.target).attr("action")
    $.ajax({
      method: "post",
      data: data,
      url: url
    }).done(function(res){
      $(e.target).parent().siblings(".panel-body").children("table").prepend(res)
      $(".add-dish-form").hide();
      $(".add-dish-button").show();
    })
  })

  $(".add-supply-button").on("click", function(e){
    e.preventDefault();
    $(".add-supply-form").addClass("animated slideInRight").one(animOver, function(){
      $(".add-supply-form").removeClass("animated slideInRight")
    })
    $(".add-supply-form").show();
    $(".add-supply-form").trigger("reset");
    $(".add-supply-button").hide();
  })

  $(".supply-panel-heading").on("submit", ".add-supply-form", function(e){
    e.preventDefault();
    var data = $(e.target).serialize()
    var url = $(e.target).attr("action")
    $.ajax({
      method: "post",
      data: data,
      url: url
    }).done(function(res){
      $(e.target).parent().siblings(".panel-body").children("table").prepend(res)
      $(".add-supply-form").hide();
      $(".add-supply-button").show();
    })
  })

  $(".add-guest-button").on("click", function(e){
    e.preventDefault();
    $(".add-guest-form").addClass("animated slideInRight").one(animOver, function(){
      $(".add-guest-form").removeClass("animated slideInRight")
    })
    $(".add-guest-form").show();
    $(".add-guest-form").trigger("reset");
    $(".add-guest-button").hide();
  })

  $(".guest-panel-heading").on("submit", ".add-guest-form", function(e){
    e.preventDefault();
    var data = $(e.target).serialize()
    var url = $(e.target).attr("action")
    $.ajax({
      method: "post",
      data: data,
      url: url
    }).done(function(res){
      $(e.target).parent().siblings(".panel-body").children("table").prepend(res)
      $(".add-guest-form").hide();
      $(".add-guest-button").show();
    })
  })

  $(".guest-list-table").on("click", ".uninvite-button", function(e){
    e.preventDefault();
    e.stopPropagation();
    var url = $(e.target).attr("href")
    var $row = $(e.target).parent().parent()
    $.ajax({
      method: "delete",
      url: url
    }).done(function(res){
      $row.remove();
    })
  })

  $(".item-list-table").on("click", ".remove-item", function(e){
    e.preventDefault();
    e.stopPropagation();
    var url = $(e.target).attr("href")
    var $row = $(e.target).parent().parent()
    $.ajax({
      method: "delete",
      url: url
    }).done(function(res){
      $row.remove();
    })
  })

  $(".cocktail-refresh").on("click", function(e){
    e.preventDefault();
    var url = $(e.target).attr("href")
    var $body = $(e.target).parent().siblings()
    $(".cocktail-panel").addClass("animated wobble").one(animOver, function(){
      $(".cocktail-panel").removeClass("animated wobble")
    })
    $.ajax({
      method: "get",
      url: url
    }).done(function(res){
      $body.html(res)
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

  $("#drinks-table").on("click", ".item-button", function(e){
    e.preventDefault();
    var $button=$(this)
    var url = $(this).parent().attr('action')
    $.ajax({
      url: url,
      method: "POST",
    }).done(function(response){
      $button.parent().parent().parent().html(response)
    })
  })

  $("#dish-table").on("click", ".item-button", function(e){
    e.preventDefault();
    var $button=$(this)
    var url = $(this).parent().attr('action')
    $.ajax({
      url: url,
      method: "POST",
    }).done(function(response){
      $button.parent().parent().parent().html(response)
    })
  })

  $("#supply-table").on("click", ".item-button", function(e){
    e.preventDefault();
    var $button=$(this)
    var url = $(this).parent().attr('action')
    $.ajax({
      url: url,
      method: "POST",
    }).done(function(response){
      $button.parent().parent().parent().html(response)
    })
  })

})
