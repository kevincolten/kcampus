// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){

  $('#term-toggler select').on('change', function (event) {
  var that = this;
  var formData = $(that.form).serialize();
  $.ajax({
    url: "/term_toggler/",
    type: "post",
    data: formData,
    success: function(){
      location.reload();
    }
  });
});
  
})