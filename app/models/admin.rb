class Admin < ActiveRecord::Base
  attr_accessible :email, :fname, :idn, :lname, :location_id, 
                  :phone, :client_id
                  
  belongs_to :location
                  
  def full_name
    "#{self.fname} #{self.lname}"
  end
end
