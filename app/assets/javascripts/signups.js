$(document).ready(function() {
  $(".info-button").on("click", function(){
    $(".prize-info").toggle();
  })

  $(".paid-button").on("click", function(event){
    event.preventDefault();
    var signupUrl = $(this).parent().parent().attr("action");
    $.ajax({
      beforeSend: function(xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: signupUrl,
      method: "patch",
      data: { changePaidStatus: true }
    }).done(function(paid_status){
      console.log(paid_status);
    })
  })
})