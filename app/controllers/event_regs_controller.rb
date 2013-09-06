class EventRegsController < ApplicationController
  
  def create
    params[:event_reg][:client_id] = current_user.client_id
    params[:event_reg].each_value { |value| value.strip! if value.is_a?(String) }
    @event = Event.find(params[:event_reg][:event_id])
    @student = Student.find_by_idn(params[:event_reg][:idn])
    if @student
      @event_reg = EventReg.new(:idn => @student.idn,
                                :fname => @student.fname,
                                :lname => @student.lname,
                                :dob => @student.dob,
                                :client_id => current_user.client_id,
                                :event_id => @event.id )
    else
      @student = Student.find_by_fname_and_lname_and_dob( 
                                               params[:event_reg][:fname],
                                               params[:event_reg][:lname],
                                               params[:event_reg][:dob])
      if @student
        @event_reg = EventReg.new(:idn => @student.idn,
                                  :fname => @student.fname,
                                  :lname => @student.lname,
                                  :dob => @student.dob,
                                  :client_id => current_user.client_id,
                                  :event_id => @event.id ) 
      else
        @event_reg = EventReg.new(params[:event_reg])
      end
    end
    
    @event_reg.save
    redirect_to term_event_url(current_term.id, @event)
    
  end
  
  def edit
  end
  
  def update
    @event_reg = EventReg.find(params[:id])
    @event_reg.update_attributes(params[:event_reg])
    @event_reg.save
    redirect_to term_event_url(current_term.id, @event_reg.event)
  end
  
  def destroy
  end
  
end
