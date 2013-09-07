class CourseRegsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @courses = Course.find_all_by_client_id_and_term_id(current_user.client_id,
                                                        current_term.id)
    @course_regs = CourseReg.includes(:course)
                            .where('course_regs.client_id = ? AND courses.term_id = ?',
                                    current_user.client_id, current_term.id)
    @students = Student.find_all_by_client_id(current_user.client_id)
    @terms = Term.find_all_by_client_id(current_user.client_id)
    @current_term_index = @terms.index(current_term)
    @term_before = @terms[@current_term_index - 1] unless @current_term_index < 1
    @event_attendees = EventReg.includes(:event)
                               .where('event_regs.client_id = ? AND events.term_id = ? AND attended = true AND event_regs.idn IS NOT NULL',
                                  current_user.client_id, current_term.id)
    @event_attendee_ids = @event_attendees.map { |attendee| attendee.idn }
    if @term_before
      @students = @students.select do |student| 
        student.attendance(@term_before) > 50 || @event_attendee_ids.include?(student.idn)
      end
    end
  end
  
  def create
    params[:course_reg][:user_id] = current_user.id
    params[:course_reg][:client_id] = current_user.client_id
    @course_reg = CourseReg.new(params[:course_reg])
    @course_reg.save
    redirect_to course_regs_url
  end
  
  def destroy
    @course_reg = CourseReg.find(params[:id])
    @course_reg.destroy
    redirect_to course_regs_url
  end
  
end
