class InstructorsController < ApplicationController
  before_filter :require_current_user!
  before_filter :require_admin!
  before_filter :require_client!, :except => [:index]
  
  def index
    @instructors = Instructor.find_all_by_client_id(current_user.client_id)
    @instructor = Instructor.new
    @locations = Location.find_all_by_client_id(current_user.client_id)
  end
  
  def new
  end
  
  def create
    params[:instructor][:client_id] = current_user.client_id
    params[:instructor].each_value { |value| value.strip! if value.is_a?(String) }
    @instructor = Instructor.new(params[:instructor])
    @instructor.save
    redirect_to instructors_url
  end
  
  def edit
    @instructor = Instructor.find(params[:id])
    @locations = Location.find_all_by_client_id(current_user.client_id)
  end
  
  def update
    @instructor = Instructor.find(params[:id])
    params[:instructor].each_value { |value| value.strip! if value.is_a?(String) }
    @instructor.update_attributes(params[:instructor])
    @instructor.save
    redirect_to instructors_url
  end
  
  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    redirect_to instructors_url
  end

end
