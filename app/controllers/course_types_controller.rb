class CourseTypesController < ApplicationController
  before_filter :require_current_user!
  before_filter :require_admin!
  before_filter :require_client!, :except => [:index]
  
  def index
    @course_types = CourseType.find_all_by_client_id(current_user.client_id)
    @course_type = CourseType.new
  end
  
  def create
    params[:course_type][:client_id] = current_user.client_id
    params[:course_type].each_value { |value| value.strip! if value.is_a?(String) }
    @course_type = CourseType.new(params[:course_type])
    if @course_type.save
      redirect_to course_types_url
    else
      redirect_to course_types_url, alert: @course_type.errors.full_messages
    end
  end
  
  def edit
    @course_type = CourseType.find(params[:id])
  end
  
  def update
    @course_type = CourseType.find(params[:id])
    params[:course_type].each_value { |value| value.strip! if value.is_a?(String) }
    @course_type.update_attributes(params[:course_type])
    @course_type.save
    redirect_to course_types_url
  end
  
  def destroy
    @course_type = CourseType.find_by_id(params[:id])
    @course_type.destroy
    redirect_to course_types_url
  end
  
end
