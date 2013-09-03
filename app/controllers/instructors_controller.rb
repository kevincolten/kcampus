class InstructorsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @instructors = Instructor.all
  end
  
  def new
    @instructor = Instructor.new
    @locations = Location.all
  end
  
  def create
    params[:instructor][:client_id] = 1
    @instructor = Instructor.new(params[:instructor])
    @instructor.save
    redirect_to instructors_url
  end
  
  def edit
    @instructor = Instructor.find(params[:id])
    @locations = Location.all
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
