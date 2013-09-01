class Instructor < ActiveRecord::Base
  attr_accessible :datatel, :email, :fname, :lname, 
                  :location_id, :pay_rate, :phone
end
