class CourseReg < ActiveRecord::Base
  attr_accessible :course_id, :student_id, :user_id, :client_id
  
  belongs_to :course
  
  belongs_to :student
  
  belongs_to :user
  
  validates :course_id, :presence => true
  validates :student_id, :presence => true
  validates :user_id, :presence => true
  validates :client_id, :presence => true
end
