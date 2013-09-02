class Instructor < ActiveRecord::Base
  attr_accessible :idn, :email, :fname, :lname, 
                  :location_id, :pay_rate, :phone
                  
  has_many :courses
  
  belongs_to :location
  
  def full_name
    "#{self.fname} #{self.lname}"
  end
  
end
