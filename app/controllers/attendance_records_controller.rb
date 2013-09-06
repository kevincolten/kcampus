class AttendanceRecordsController < ApplicationController
  
  def create
    params[:attendance_record][:client_id] = current_user.client_id
    @course = Course.find(params[:attendance_record][:course_id])
    @attendance_record = AttendanceRecord.new(params[:attendance_record])
    @attendance_record.save
    redirect_to term_course_url(current_term.id, @course)
  end
  
  def destroy
    @attendance_record = AttendanceRecord.find(params[:id])
    @course = Course.find(@attendance_record.course_id)
    @attendance_record.destroy
    redirect_to term_course_url(current_term.id, @course)
  end
  
end
