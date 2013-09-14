class EventRegsController < ApplicationController
  
  def create
    params[:event_reg][:client_id] = current_user.client_id
    params[:event_reg].each_value do |value| 
      if value.is_a?(String)
        value.strip!
        value.capitalize!
      end
    end
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
    redirect_to event_url(@event)
    
  end
  
  def edit
    @event_reg = EventReg.find(params[:id])
  end
  
  def update
    @event_reg = EventReg.find(params[:id])
    if params[:event_reg][:attended]
      @event_reg.update_attributes(:attended => params[:event_reg][:attended])
      @event_reg.save
    elsif params[:event_reg][:idn] 
      @student = Student.find_by_idn(params[:event_reg][:idn])
      if @student
        @event_reg.update_attributes(:idn => @student.idn,
                                     :fname => @student.fname,
                                     :lname => @student.lname,
                                     :dob => @student.dob)
        @event_reg.save
      end
    end
    redirect_to event_url(@event_reg.event_id)
  end
  
  def destroy
    @event_reg = EventReg.find(params[:id])
    @event = Event.find(@event_reg.event_id)
    @event_reg.destroy
    redirect_to event_url(@event)
  end
  
end