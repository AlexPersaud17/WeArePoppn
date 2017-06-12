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
      $(e.target).parent().siblings(".panel-body").children("table").append(res)
      $(".add-drinks-form").hide();
      $(".add-drinks-button").show();
    })
  })
});
