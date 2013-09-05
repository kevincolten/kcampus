class EventReg < ActiveRecord::Base
  attr_accessible :event_id, :student_id
  
  belongs_to :event
  
  belongs_to :student
  
  validates :event_id, :presence => true
  validates :student_id, :presence => true
  
end
