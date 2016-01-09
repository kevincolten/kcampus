class LocationsController < ApplicationController
  before_filter :require_current_user!
  before_filter :require_admin!

  def index
    @locations = Location.find_all_by_client_id(current_user.client_id)
    @location = Location.new
  end

  def new
    @location = Location.new
  end

  def create
    params[:location][:contact_phone] = params[:location][:contact_phone].split("").select{|x| x[/\d+/]}.join("")
    params[:location][:client_id] = current_user.client_id
    params[:location].each_value { |value| value.strip! if value.is_a?(String) }
    @location = Location.new(params[:location])
    if @location.save
      redirect_to locations_url
    else
      redirect_to locations_url, alert: @location.errors.full_messages
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    params[:location].each_value { |value| value.strip! if value.is_a?(String) }
    @location.update_attributes(params[:location])
    @location.save!
    redirect_to locations_url
  end

  def destroy
    @location = Location.find(params[:id])
    @location.delete
    redirect_to locations_url
  end


end
