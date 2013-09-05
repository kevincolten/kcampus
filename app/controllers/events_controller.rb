class EventsController < ApplicationController
  before_filter :require_current_user!
  
  def index
    @events = Event.find_all_by_client_id(current_user.client_id)
    @event = Event.new
    @terms = Term.find_all_by_client_id(current_user.client_id)
    @locations = Location.find_all_by_client_id(current_user.client_id)
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
    @terms = Term.find_all_by_client_id(current_user.client_id)
    @locations = Location.find_all_by_client_id(current_user.client_id)
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
