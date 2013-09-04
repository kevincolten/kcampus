class AdminsController < ApplicationController
  
  before_filter :require_current_user!
  
  def index
    @admins = Admin.all
    @admin = Admin.new
    @locations = Location.all
  end
  
  def new
    
  end
  
  def create
    params[:admin][:client_id] = current_user.client_id
    @admin = Admin.new(params[:admin])
    @admin.save
    redirect_to admins_url
  end
  
  def edit
    @admin = Admin.find(params[:id])
    @locations = Location.all
  end
  
  def update
    @admin = Admin.find(params[:id])
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
