class EventRegsController < ApplicationController
  
  def new
  end
  
  def create
    @student = Student.find_by_idn_and_email_and_dob(
                        params[:event_reg][:idn],
                        params[:event_reg][:email],
                        params[:event_reg][:dob])
    redirect_to student_url(@student)
  end
  
end
