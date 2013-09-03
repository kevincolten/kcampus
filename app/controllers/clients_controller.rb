class ClientsController < ApplicationController
  
  def new
  end
  
  def create
    ActiveRecord::Base.transaction do
      @client = Client.new(params[:client])
      @client.save
      params[:user][:email] = params[:client][:email]
      params[:user][:client_id] = @client.id
      params[:user][:client] = true
      @user = User.new(params[:user])
      @user.save
    end
    redirect_to new_session_url
  end
  
end
