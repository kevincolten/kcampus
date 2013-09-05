class Admin < ActiveRecord::Base
  attr_accessible :email, :fname, :idn, :lname, :location_id, 
                  :phone, :client_id
                  
  belongs_to :location
  
  validates :email, :presence => true
  validates :fname, :presence => true
  validates :lname, :presence => true
  validates :idn, :presence => true
  validates :location_id, :presence => true
  validates :phone, :presence => true
  validates :client_id, :presence => true
                  
  def full_name
    "#{self.fname} #{self.lname}"
  end
end
