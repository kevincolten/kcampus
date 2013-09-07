class AdminsController < ApplicationController
  
  before_filter :require_current_user!
  before_filter :require_admin!
  before_filter :require_client!, :except => [:index]
  
  def index
    @admins = Admin.find_all_by_client_id(current_user.client_id)
    @admin = Admin.new
    @locations = Location.find_all_by_client_id(current_user.client_id)
  end
  
  def new
    
  end
  
  def create
    params[:admin][:client_id] = current_user.client_id
    params[:admin].each_value { |value| value.strip! if value.is_a?(String) }
    @admin = Admin.new(params[:admin])
    @admin.save
    redirect_to admins_url
  end
  
  def edit
    @admin = Admin.find(params[:id])
    @locations = Location.find_all_by_client_id(current_user.client_id)
  end
  
  def update
    @admin = Admin.find(params[:id])
    params[:admin].each_value { |value| value.strip! if value.is_a?(String) }
    @admin.update_attributes(params[:admin])
    @admin.save
    redirect_to admins_url
  end
  
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to admins_url
  end
  
end
