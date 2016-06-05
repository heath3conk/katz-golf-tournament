$(document).ready(function() {
  $(".info-button").on("click", function(){
    $(".prize-info").toggle();
  })

  $('select').material_select();

  $(".paid-button").on("click", function(event){
    event.preventDefault();
    var signup = $(this);
    $.ajax({
      url: signup.attr("href"),
      method: "patch"
    }).done(function(paid_status){
      console.log(paid_status);
    })
  })

})