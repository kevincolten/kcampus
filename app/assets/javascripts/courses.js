// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){

  $(".attn-form").on("click", 'input[type="submit"]', function (event) {
    event.preventDefault();
    var that = this;
    var formData = $(that.parentElement).serialize();
    var hours = $(that.parentElement.children).filter('#attendance_hours').val();
    $(that).prop("disabled", true);
    $.ajax({
      url: "/attendance_records",
      type: "post",
      data: formData,
      success: function (response) {
        var string = "<input type='text' value='" + hours
        string = string + "'class='form-control' readonly >"
        string = string + "<a href='#' attn-id='" + response.id
        string = string + "'stu-id='" + response.student_id
        string = string + "'course-id='" + response.course_id
        string = string + "'date='" + response.date + "''>delete</a>"
        console.log(string)
        $(that.form).html(string);
      }
    });
  });

  $(".attn-form").on("click", "a", function (event){
    event.preventDefault();
    var that = this;
    var attn_id = $(that).attr("attn-id");
    var student_id = $(that).attr("stu-id");
    var course_id = $(that).attr("course-id");
    var date = $(that).attr("date");
    var string = '<input type="hidden" name="attendance_record[student_id]"';
        string = string + 'value="' + student_id + '">';
        string = string + '<input type="hidden" name="attendance_record[course_id]"';
        string = string + 'value="' + course_id + '">';
        string = string + '<input type="hidden" name="attendance_record[date]"';
        string = string + 'value="' + date + '">';
        string = string + '<input type="text" class="form-control"';
        string = string + 'name="attendance_record[hours]" id="attendance_hours">';
        string = string + '<input type="submit" value="Submit"';
        string = string + 'class="btn btn-primary btn-xs">';
    $.ajax({
      url: "/attendance_records/" + attn_id,
      type: "delete",
      success: function(){
        $(that.parentElement).html(string);
      }
    });
  });

});