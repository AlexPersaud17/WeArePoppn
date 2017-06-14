$(document).ready(function(){

  var animOver = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';

  $(".add-drinks-button").on("click", { formSelector: ".add-drinks-form" }, slideForm);
  $(".add-dish-button").on("click", { formSelector: ".add-dish-form" }, slideForm);
  $(".add-supply-button").on("click", { formSelector: ".add-supply-form" }, slideForm);
  $(".add-guest-button").on("click", { formSelector: ".add-guest-form" }, slideForm)


  $(".drinks-panel-heading").on("submit", ".add-drinks-form", {buttonSelector: ".add-drinks-button"}, addRow)
  $(".dish-panel-heading").on("submit", ".add-dish-form", {buttonSelector: ".add-dish-button"}, addRow)
  $(".supply-panel-heading").on("submit", ".add-supply-form", {buttonSelector: ".add-supply-button"}, addRow)
  $(".guest-panel-heading").on("submit", ".add-guest-form", {buttonSelector: ".add-guest-button"}, addRow)


  $("#drinks-table").on("click", ".item-button", claimItem);
  $("#dish-table").on("click", ".item-button", claimItem);
  $("#supply-table").on("click", ".item-button", claimItem);


  $(".guest-list-table").on("click", ".uninvite-button", removeRow)
  $(".item-list-table").on("click", ".remove-item", removeRow)



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

  function slideForm(e){
    e.preventDefault();
    $(e.data.formSelector).addClass("animated slideInRight").one(animOver, function(){
      $(e.data.formSelector).removeClass("animated slideInRight")
    })
    $(e.data.formSelector).show();
    $(e.data.formSelector).trigger("reset");
    $(this).hide();
  }

  function claimItem(e){
    e.preventDefault();
    var $button=$(this)
    var url = $(this).parent().attr('action')
    $.ajax({
      url: url,
      method: "POST",
    }).done(function(response){
      $button.parent().parent().parent().html(response)
    })
  }

  function addRow(e){
    e.preventDefault();
    var data = $(e.target).serialize()
    var url = $(e.target).attr("action")
    $.ajax({
      method: "post",
      data: data,
      url: url
    }).done(function(res){
      $(e.target).parent().siblings(".panel-body").children("table").prepend(res)
      $(e.target).hide();
      $(e.data.buttonSelector).show();
    })
  }

  function removeRow(e){
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
  }

})
