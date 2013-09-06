class CourseRegsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @course_regs = CourseReg.find_all_by_client_id(current_user.client_id)
    @students = Student.find_all_by_client_id(current_user.client_id)
    @courses = Course.find_all_by_client_id(current_user.client_id)
  end
  
  def create
    params[:course_reg][:user_id] = current_user.id
    params[:course_reg][:client_id] = current_user.client_id
    @course_reg = CourseReg.new(params[:course_reg])
    @course_reg.save
    redirect_to term_course_regs_url(current_term.id)
  end
  
  def destroy
    @course_reg = CourseReg.find(params[:id])
    @course_reg.destroy
    redirect_to term_course_regs_url(current_term.id)
  end
  
end
