class CourseTypesController < ApplicationController
  
  def create
    @course_type = CourseType.new(params[:course_type])
    @course_type.save
    redirect_to new_course_url
  end
  
  def destroy
    @course_type = CourseType.find_by_id(params[:course_type][:id])
    @course_type.destroy!
    redirect_to new_course_url
  end
  
end
