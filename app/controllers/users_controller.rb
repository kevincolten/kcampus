class UsersController < ApplicationController
	before_filter :require_current_user!, :only => [:show]
	before_filter :require_no_current_user!, :only => [:create, :new]
  
	def create
    params[:user][:admin] = false
    params[:user].each_value  do |value| 
      if value.is_a?(String)
        value.strip!
        value.downcase!
      end
    end
    @admin = Admin.find_by_email(params[:user][:email])
    @instructor = Instructor.find_by_email(params[:user][:email])
    if (@admin || @instructor)
      if @admin
        params[:user][:admin] = true
        params[:user][:client_id] = @admin.client_id
      end
      if @instructor
        params[:user][:instructor] = true  
        params[:user][:client_id] = @instructor.client_id
      end
      @user = User.new(params[:user])
      if @user.save
        self.current_user = @user
        redirect_to user_url(@user)
      else
        render :json => @user.errors.full_messages
      end
    else
      render :json => "Email not registered"
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