class AttendanceRecord < ActiveRecord::Base
  attr_accessible :client_id, :course_id, :date, :hours, :student_id
  
  belongs_to :student
  
  belongs_to :course
  
  validates :client_id, :presence => true
  validates :course_id, :presence => true
  validates :student_id, :presence => true
  validates :date, :presence => true
  validates :hours, :presence => true
  
end
