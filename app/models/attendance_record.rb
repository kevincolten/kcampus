class AttendanceRecord < ActiveRecord::Base
  attr_accessible :client_id, :course_id, :date, :hours, :student_id
  
  belongs_to :student
  
  belongs_to :course
  
end
