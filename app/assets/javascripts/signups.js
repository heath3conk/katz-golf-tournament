$(document).ready(function() {
  $(".info-button").on("click", function(){
    $(".prize-info").toggle();
  })

  $(".paid-button").on("click", function(event){
    event.preventDefault();
    var chosenSignup = $(this).closest("td").children("p");
    var signupUrl = $(this).closest("form").attr("action");
    $.ajax({
      beforeSend: function(xhr){xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      url: signupUrl,
      method: "patch",
      data: { changePaidStatus: true }
    }).done(function(updated_status){
      chosenSignup.html(updated_status.paidStatus);
    })
  });

  $(".details-button").on("click", function(event){
    event.preventDefault();
  
  })
})