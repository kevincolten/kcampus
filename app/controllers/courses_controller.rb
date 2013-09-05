class CoursesController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @courses = Course.find_all_by_client_id(current_user.client_id)
    @course = Course.new
    @terms = Term.find_all_by_client_id(current_user.client_id)
    @locations = Location.find_all_by_client_id(current_user.client_id)
    @instructors = Instructor.find_all_by_client_id(current_user.client_id)
    @course_types = CourseType.find_all_by_client_id(current_user.client_id)
    @days = ["Sunday", "Monday", "Tuesday", "Wednesday", 
             "Thursday", "Friday", "Saturday"]
    @budget_codes = [80001]
    @course_days = @course.course_days
  end
  
  def new
    @course = Course.new
    @terms = Term.all
    @locations = Location.all
    @instructors = Instructor.all
    @course_types = CourseType.all
    @days = ["Sunday", "Monday", "Tuesday", "Wednesday", 
             "Thursday", "Friday", "Saturday"]
    @budget_codes = [80001]
    @course_days = @course.course_days
  end
  
  def create
    params[:course][:client_id] = current_user.client_id
    @course = Course.new(params[:course])
    if @course.save
      redirect_to courses_url
    else
      render :json => @course.errors.full_messages
    end
  end
  
  def show
    @course = Course.find(params[:id])
    @attendance_records = AttendanceRecord.find_all_by_course_id(@course.id)
    @dates = @course.dates
    @month_years = @course.month_years
    @students = @course.students
  end
  
  def edit
    @course = Course.find(params[:id])
    @terms = Term.all
    @locations = Location.all
    @instructors = Instructor.all
    @course_types = CourseType.all
    @days = ["Sunday", "Monday", "Tuesday", "Wednesday", 
             "Thursday", "Friday", "Saturday"]
    @budget_codes = [80001]
    @course_days = @course.course_days
  end
  
  def update
    @course = Course.find(params[:id])
    @course.update_attributes(params[:course])
    @course.save!
    redirect_to courses_url
  end
  
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_url
  end
  
end
