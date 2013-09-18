class CourseRegsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @students, @course_regs, @courses = [], [], []
    @all_students = Student.find_all_by_client_id(current_user.client_id)
                           .sort_by { |student| student.lname}
    @all_courses = Course.find_all_by_client_id(current_user.client_id)
                         .sort_by{ |course| course.dept_code }

    @term_next = Term.where('client_id = ? AND reg_start < ? AND reg_end > ?', 
                        current_user.client_id, Date.today, Date.today).first

    if @term_next
      @term_before = Term.where('client_id = ? AND end_date = (SELECT MAX(end_date) FROM terms WHERE end_date <= ?)', current_user.client_id, @term_next.start_date).first

      @courses = @all_courses.select do |course| 
        course.term_id == @term_next.id && course.students.count < course.max_seats
      end
      @course_regs = CourseReg.includes(:course)
                              .where('course_regs.client_id = ? AND courses.term_id = ?',
                                      current_user.client_id, @term_next.id)
      
      
      
      


      @event_attendees = EventReg.includes(:event)
                                 .where('event_regs.client_id = ? AND events.term_id = ? AND attended = true AND event_regs.idn IS NOT NULL',
                                    current_user.client_id, @term_next.id)
      @event_attendee_ids = @event_attendees.map { |attendee| attendee.idn }

      if @term_before
        @students = @all_students.select do |student| 
          student.attendance(@term_before) > 50 || @event_attendee_ids.include?(student.idn)
        end
      end
      render :index
    else
      flash.now[:alert] = ["No Registrations Open"]
      render :index
    end
  end
  
  def create
    if params[:course_reg]
      params[:course_reg][:user_id] = current_user.id
      params[:course_reg][:client_id] = current_user.client_id
      @course_reg = CourseReg.new(params[:course_reg])
      @course_reg.save
    end
    redirect_to course_regs_url
  end
  
  def destroy
    @course_reg = CourseReg.find(params[:id])
    @course_reg.destroy
    redirect_to course_regs_url
  end
  
end
