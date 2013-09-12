// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function(){
  $(".attended-form").on("click", 'input[type="radio"]', function (event) {
    var that = this;
    var dataID = $(that).attr("data-id")
    var formData = $(that.form).serialize();
    $.ajax({
      url: "/event_regs/" + dataID,
      type: "put",
      data: formData
    });
  });
});