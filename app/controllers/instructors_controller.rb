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
    @instructor = Instructor.new(params[:instructor])
    @instructor.save
    redirect_to instructors_url
  end
  
  def edit
  end
  
  def update
  end

end
