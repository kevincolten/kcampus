class Instructor < ActiveRecord::Base
  attr_accessible :idn, :email, :fname, :lname, 
                  :location_id, :pay_rate, :phone, :client_id
                  
  has_many :courses
  
  belongs_to :location
  
  validates :idn, :presence => true
  validates :email, :presence => true
  validates :fname, :presence => true
  validates :lname, :presence => true
  validates :location_id, :presence => true
  validates :pay_rate, :presence => true
  validates :phone, :presence => true
  validates :client_id, :presence => true
  
  def full_name
    "#{self.fname} #{self.lname}"
  end
  
end
