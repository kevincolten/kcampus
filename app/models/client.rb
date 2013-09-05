class Client < ActiveRecord::Base
  attr_accessible :email, :fname, :lname, :organization, :phone
  
  validates :fname, :presence => true
  validates :lname, :presence => true
  validates :email, :presence => true
  validates :organization, :presence => true
  validates :phone, :presence => true
  
end
