class CoursesController < ApplicationController
  
  def index
    @courses = @courses.all
  end
  
  def new
    @course = Course.new
    @terms = Term.all
    @locations = Location.all
  end
  
  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to courses_url
    else
      render :json => @course.errors.full_messages
    end
  end
  
  def show
    @course = Course.find(params[:id])
  end
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    @course.update_attributes(params[:course])
    @course.save!
    redirect_to course_url(@course)
  end
  
  def destroy
    @course = Course.find(params[:id])
    @course.destroy!
    redirect_to courses_url
  end
  
end
