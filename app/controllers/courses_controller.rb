class CoursesController < ApplicationController
  before_filter :require_current_user!
  before_filter :require_client!, :except => [:index, :show]
  
  def index
    if current_user.admin || current_user.client
      @courses = Course.find_all_by_client_id_and_term_id(current_user.client_id,
                                                          current_term.id)
    elsif current_user.instructor
      @instructor = Instructor.find_by_email(current_user.email)
      @courses = Course.find_all_by_client_id_and_term_id_and_instructor_id(
                                                          current_user.client_id,
                                                          current_term.id,
                                                          @instructor.id)
    end
    @terms = Term.find_all_by_client_id(current_user.client_id)
    @course = Course.new
    @term = current_term
    @locations = Location.find_all_by_client_id(current_user.client_id)
    @instructors = Instructor.find_all_by_client_id(current_user.client_id)
    @course_types = CourseType.find_all_by_client_id(current_user.client_id)
    @days = ["Sun", "Mon", "Tues", "Wed", 
             "Thurs", "Fri", "Sat"]
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
    redirect_to root_url unless @course.client_id == current_user.client_id
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
