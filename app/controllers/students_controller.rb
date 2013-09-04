class StudentsController < ApplicationController
  before_filter :require_current_user!, :except => :show
  
  def index
    @students = Student.all
  end
  
  def show
    @student = Student.find(params[:id])
    @events = Event.where("date > ? AND client_id = ?", 
                          Date.today, @student.client_id)
  end
  
end
