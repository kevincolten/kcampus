class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
    @terms = Term.all
    @locations = Location.all
  end
  
  def create
    params[:event][:client_id] = current_user.client_id
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_url
    else
      render :json => @event.errors.full_messages
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
    @terms = Term.all
    @locations = Location.all
  end
  
  def update
    @event = Event.find(params[:id])
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
