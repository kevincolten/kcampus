class CourseRegsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @course_regs = CourseReg.find_all_by_client_id(current_user.client_id)
  end
  
  def new
    @students = Student.find_all_by_client_id(current_user.client_id)
    @courses = Course.find_all_by_client_id(current_user.client_id)
  end
  
  def create
    params[:course_reg][:user_id] = current_user.id
    params[:course_reg][:client_id] = current_user.client_id
    @course_reg = CourseReg.new(params[:course_reg])
    @course_reg.save
    redirect_to new_course_reg_url
  end
  
end
