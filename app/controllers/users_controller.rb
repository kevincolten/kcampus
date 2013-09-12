class UsersController < ApplicationController
	before_filter :require_current_user!, :only => [:show]
	before_filter :require_no_current_user!, :only => [:create, :new]
  
	def create
    if params[:user][:password] == params[:user][:confirm_password]
      params[:user].delete(:confirm_password)
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
          redirect_to courses_url
        else
          redirect_to new_user_url, alert: @user.errors.full_messages
        end
      else
        redirect_to new_user_url, alert: (params[:user][:email].empty?) ? 
          ["Email can't be blank"] : ["Email not registered"]
      end
    else
      redirect_to new_user_url, alert: ["Password doesn't match"]
    end
  end

  def new
    @user = User.new
  end

end