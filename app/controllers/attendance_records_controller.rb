class AttendanceRecordsController < ApplicationController
  before_filter :require_current_user!
  before_filter :require_admin!, :only => [:index, :update]

  def create
    params[:attendance_record][:client_id] = current_user.client_id
    @course = Course.find(params[:attendance_record][:course_id])
    @attendance_record = AttendanceRecord.new(params[:attendance_record])
    @attendance_record.save
    render :json => @attendance_record
  end
  
  def destroy
    @attendance_record = AttendanceRecord.find(params[:id])
    @course = Course.find(@attendance_record.course_id)
    @attendance_record.destroy
    render :json => true
  end
  
end
