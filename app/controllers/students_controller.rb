class StudentsController < ApplicationController
  before_filter :require_current_user!, :except => :show
  
  def index
    @students = Student.find_all_by_client_id(current_user.client_id)
                       .sort_by{ |student| student.lname}
  end
  
  def show
    @student = Student.find(params[:id])
    @events = Event.where("date > ? AND client_id = ?", 
                          Date.today, @student.client_id)
  end
  
end
