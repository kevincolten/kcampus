class Location < ActiveRecord::Base
  attr_accessible :address, :city, :code, :contact_email, :contact_name, 
                  :contact_phone, :name, :state, :zipcode

  validates :address, :presence => true
  validates :city, :presence => true
  validates :code, :presence => true
  validates :contact_email, :presence => true
  validates :contact_name, :presence => true
  validates :contact_phone, :presence => true
  validates :name, :presence => true
  validates :state, :presence => true
  validates :zipcode, :presence => true
  

end
