$(document).ready(function(event){
  $(".add-drinks-button").on("click", (e) => {
    e.preventDefault();
    $(".add-drinks-form").show();
    $(".add-drinks-form").trigger("reset");
    $(".add-drinks-button").hide();
  })

  $(".drinks-panel-heading").on("submit", ".add-drinks-form", (e) => {
    e.preventDefault();
    var data = $(e.target).serialize()
    var url = $(e.target).attr("action")
    $.ajax({
      method: "post",
      data: data,
      url: url
    }).done(function(res){
      $(e.target).parent().siblings(".panel-body").children("table").prepend(res)
      $(".add-drinks-form").hide();
      $(".add-drinks-button").show();
    })
  })

  $(".add-dish-button").on("click", (e) => {
    e.preventDefault();
    $(".add-dish-form").show();
    $(".add-dish-form").trigger("reset");
    $(".add-dish-button").hide();
  })

  $(".dish-panel-heading").on("submit", ".add-dish-form", (e) => {
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

  $(".add-supply-button").on("click", (e) => {
    e.preventDefault();
    $(".add-supply-form").show();
    $(".add-supply-form").trigger("reset");
    $(".add-supply-button").hide();
  })

  $(".supply-panel-heading").on("submit", ".add-supply-form", (e) => {
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



});
