class EventReg < ActiveRecord::Base
  attr_accessible :event_id, :client_id, :fname, :lname, :dob,
                  :idn, :attended
  
  belongs_to :event
    
  validates :event_id, :presence => true
  validates :client_id, :presence => true
  validates :fname, :presence => true
  validates :lname, :presence => true
  validates :dob, :presence => true
  
  def name
    "#{self.lname}, #{self.fname}"
  end
end
