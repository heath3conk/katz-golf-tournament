var ready;
ready = function() {
  $(".info-button").on("click", function(){
    $(".prize-info").toggle();
  })

  $(".tee").on("click", function(){
    var teeBox = $(this);
    $(".tee").prop("checked", false);
    teeBox.prop("checked", true);
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
      console.log(updated_status)
      chosenSignup.html(updated_status.paidStatus);
    })
  });

  $(".details-button").on("click", function(event){
    event.preventDefault();
    $(this).closest("tr").next("tr").toggleClass("signup-details");
  })

 // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal-trigger').leanModal();

  $('div').on('click', '.modal-action', function(event){
    event.preventDefault();
    var signupTypeUrl = $(this).closest("form").attr("action");
    var signupTypeTotal = $(this).closest("form").children("input#number").val()
    $.ajax({
      url: signupTypeUrl,
      method: "get",
      data: { numberToSignup: signupTypeTotal }
    }).done()
  })
}

$(document).ready(ready);
$(document).on("page:load", ready);