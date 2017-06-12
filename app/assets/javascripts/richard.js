$(document).ready(function(){
  $("#drinks-table").on("click", ".drinks-button", function(e){
    e.preventDefault();
    $button=$(this)
    url = $(this).parent().attr('action')
    $.ajax({
      url: url,
      method: "POST",
    }).done(function(response){
      $button.parent().parent().parent().html(response)
    })
  })
})
