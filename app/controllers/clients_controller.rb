class ClientsController < ApplicationController
  
  def new
  end
  
  def create
    ActiveRecord::Base.transaction do
      params[:client].each_value { |value| value.strip! if value.is_a?(String) }
      @client = Client.new(params[:client])
      @success = @client.save
      params[:user][:email] = params[:client][:email]
      params[:user][:client_id] = @client.id
      params[:user][:admin] = true
      params[:user][:client] = true
      params[:user].each_value { |value| value.strip! if value.is_a?(String) }
      @user = User.new(params[:user])
      @success = @user.save && success
    end
    if @success
      redirect_to new_session_url
    else
      redirect_to new_client_url, alert: @client.errors.full_messages << @user.errors.full_messages
    end

  end
  
end
