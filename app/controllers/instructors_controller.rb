class InstructorsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @instructors = Instructor.find_all_by_client_id(current_user.client_id)
    @instructor = Instructor.new
    @locations = Location.find_all_by_client_id(current_user.client_id)
  end
  
  def new
  end
  
  def create
    params[:instructor][:client_id] = current_user.client_id
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
