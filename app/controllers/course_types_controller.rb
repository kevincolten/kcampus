class CourseTypesController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @course_types = CourseType.all
  end
  
  def new
    @course_type = CourseType.new
  end
  
  def create
    @course_type = CourseType.new(params[:course_type])
    @course_type.save
    redirect_to course_types_url
  end
  
  def edit
    @course_type = CourseType.find(params[:id])
  end
  
  def update
    @course_type = CourseType.find(params[:id])
    @course_type.update_attributes(params[:course_type])
    @course_type.save
    redirect_to course_types_url
  end
  
  def destroy
    @course_type = CourseType.find_by_id(params[:course_type][:id])
    @course_type.destroy!
    redirect_to course_types_url
  end
  
end
