$(document).ready(function(){
  $("#drinks-table").on("click", ".item-button", function(e){
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

  $("#dish-table").on("click", ".item-button", function(e){
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

  $("#supply-table").on("click", ".item-button", function(e){
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


  $(function() {
  	$('.page-scroll').on('click', function(e) {
  		e.preventDefault();
  	$('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top}, 500, 'linear');
  	});
  });

  
})
