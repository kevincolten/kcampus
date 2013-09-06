class CoursesController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @courses = Course.find_all_by_client_id_and_term_id(current_user.client_id,
                                                        current_term.id)
    @course = Course.new
    @term = current_term
    @locations = Location.find_all_by_client_id(current_user.client_id)
    @instructors = Instructor.find_all_by_client_id(current_user.client_id)
    @course_types = CourseType.find_all_by_client_id(current_user.client_id)
    @days = ["Sunday", "Monday", "Tuesday", "Wednesday", 
             "Thursday", "Friday", "Saturday"]
    @course_days = @course.course_days
  end
  
  def create
    params[:course][:term_id] = current_term.id
    params[:course][:client_id] = current_user.client_id
    params[:course].each_value { |value| value.strip! if value.is_a?(String) }
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
    @term = current_term
    @locations = Location.all
    @instructors = Instructor.all
    @course_types = CourseType.all
    @days = ["Sunday", "Monday", "Tuesday", "Wednesday", 
             "Thursday", "Friday", "Saturday"]
    @course_days = @course.course_days
  end
  
  def update
    @course = Course.find(params[:id])
    params[:course].each_value { |value| value.strip! if value.is_a?(String) }
    @course.update_attributes(params[:course])
    @course.save!
    redirect_to courses_url
  end
  
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to term_courses_url(current_term.id)
  end
  
end
