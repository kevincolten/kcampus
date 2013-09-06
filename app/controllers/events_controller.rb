class EventsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @events = Event.find_all_by_client_id_and_term_id(current_user.client_id,
                                                      current_term.id)
    @event = Event.new
    @terms = Term.find_all_by_client_id(current_user.client_id)
    @locations = Location.find_all_by_client_id(current_user.client_id)
  end
  
  def create
    params[:event][:client_id] = current_user.client_id
    params[:event].each_value { |value| value.strip! if value.is_a?(String) }
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_url
    else
      render :json => @event.errors.full_messages
    end
  end
  
  def show
    @event = Event.find(params[:id])
    EventReg.find_all_by_event_id(params[:id]).each do |event_reg|
      unless event_reg.idn
        @student = Student.find_by_fname_and_lname_and_dob( event_reg.fname,
                                                            event_reg.lname,
                                                            event_reg.dob )
        if @student
          event_reg.update_attributes(:idn => @student.idn)
          event_reg.save
        end
      end
    end
    @event_regs = EventReg.find_all_by_event_id(params[:id])
                          .sort{ |x, y| x.lname <=> y.lname }
    @event_reg = EventReg.new
  end
  
  def edit
    @event = Event.find(params[:id])
    @terms = Term.find_all_by_client_id(current_user.client_id)
    @locations = Location.find_all_by_client_id(current_user.client_id)
  end
  
  def update
    @event = Event.find(params[:id])
    params[:event].each_value { |value| value.strip! if value.is_a?(String) }
    @event.update_attributes(params[:event])
    @event.save!
    redirect_to events_url
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end
  
end
