class ClientsController < ApplicationController
  
  def new
  end
  
  def create
    ActiveRecord::Base.transaction do
      params[:client].each_value { |value| value.strip! if value.is_a?(String) }
      @client = Client.new(params[:client])
      @client.save
      params[:user][:email] = params[:client][:email]
      params[:user][:client_id] = @client.id
      params[:user][:client] = true
      params[:user].each_value { |value| value.strip! if value.is_a?(String) }
      @user = User.new(params[:user])
      @user.save
      @student1 = Student.new( :idn => "9638521",
                               :fname => "Caleb",
                               :lname => "Guidry",
                               :dob => "1986-12-30",
                               :phone => "1234567890",
                               :email => "caleb@hello.com",
                               :client_id => @client.id )
                         
      @student1.save
                         
      @student2 = Student.new( :idn => "1472583",
                               :fname => "Cody",
                               :lname => "Broussard",
                               :dob => "1987-1-24",
                               :phone => "1234567890",
                               :email => "cody@hello.com",
                               :client_id => @client.id )
                         
      @student2.save

      @student3 = Student.new( :idn => "9638521",
                               :fname => "Brian",
                               :lname => "Romero",
                               :dob => "1986-12-30",
                               :phone => "1234567890",
                               :email => "caleb@hello.com",
                               :client_id => @client.id )
                         
      @student3.save
                         
      @student4 = Student.new( :idn => "1472583",
                               :fname => "Bryce",
                               :lname => "Davis",
                               :dob => "1987-1-24",
                               :phone => "1234567890",
                               :email => "cody@hello.com",
                               :client_id => @client.id )
                         
      @student4.save

      @student5 = Student.new( :idn => "9638521",
                               :fname => "Caanan",
                               :lname => "Falcon",
                               :dob => "1986-12-30",
                               :phone => "1234567890",
                               :email => "caleb@hello.com",
                               :client_id => @client.id )
                         
      @student5.save
                         
      @student6 = Student.new( :idn => "1472583",
                               :fname => "Reid",
                               :lname => "Batson",
                               :dob => "1987-1-24",
                               :phone => "1234567890",
                               :email => "cody@hello.com",
                               :client_id => @client.id )
                         
      @student6.save

      @student7 = Student.new( :idn => "9638521",
                               :fname => "Justin",
                               :lname => "Carter",
                               :dob => "1986-12-30",
                               :phone => "1234567890",
                               :email => "caleb@hello.com",
                               :client_id => @client.id )
                         
      @student7.save
                         
      @student8 = Student.new( :idn => "1472583",
                               :fname => "Drew",
                               :lname => "Miranda",
                               :dob => "1987-1-24",
                               :phone => "1234567890",
                               :email => "cody@hello.com",
                               :client_id => @client.id )
                         
      @student8.save

      @student9 = Student.new( :idn => "1472583",
                               :fname => "Oscar",
                               :lname => "Chavez",
                               :dob => "1987-1-24",
                               :phone => "1234567890",
                               :email => "cody@hello.com",
                               :client_id => @client.id )
                         
      @student9.save

      @student10 = Student.new( :idn => "1472583",
                               :fname => "Cesar",
                               :lname => "Chavez",
                               :dob => "1987-1-24",
                               :phone => "1234567890",
                               :email => "cody@hello.com",
                               :client_id => @client.id )
                         
      @student10.save
    end
    redirect_to new_session_url
  end
  
end
