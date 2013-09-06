class UsersController < ApplicationController
	before_filter :require_current_user!, :only => [:show]
	before_filter :require_no_current_user!, :only => [:create, :new]
  
	def create
    params[:user][:client_id] = current_user.client_id
    params[:user][:admin] = false
    params[:user].each_value { |value| value.strip! if value.is_a?(String) }
    @user = User.new(params[:user])
    if @user.save
      self.current_user = @user
      redirect_to user_url(@user)
    else
      render :json => @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
    else
      redirect_to user_url(current_user)
    end
  end
end