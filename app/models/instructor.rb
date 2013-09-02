class Instructor < ActiveRecord::Base
  attr_accessible :datatel, :email, :fname, :lname, 
                  :location_id, :pay_rate, :phone
                  
  has_many :courses
  
  def full_name
    "#{self.fname} #{self.lname}"
  end
  
end
