$(document).ready(function(event){
  $(".add-drinks-button").on("click", function(e){
    e.preventDefault();
    $(".add-drinks-form").show();
    $(".add-drinks-form").trigger("reset");
    $(".add-drinks-button").hide();
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
      $(e.target).parent().siblings(".panel-body").children("table").children().prepend(res)
      $(".drink-table-body").prepend(res)
      $(".add-drinks-form").hide();
      $(".add-drinks-button").show();
    })
  })

  $(".add-dish-button").on("click", function(e){
    e.preventDefault();
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
      if(!res.includes("email-fail-error")){
        $(e.target).parent().siblings(".panel-body").children("table").prepend(res)
        $(".add-guest-form").hide();
        $(".add-guest-button").show();
        $(".append-email-error").children().remove();
        $(".append-email-error").hide();
      }else{
        $(".append-email-error").show();
        $(".append-email-error").children().remove();
        $(".append-email-error").append(res)
      }
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
    $.ajax({
      method: "get",
      url: url
    }).done(function(res){
      $body.html(res)
    })

  })






});
