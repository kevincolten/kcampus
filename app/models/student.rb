class Student < ActiveRecord::Base
  attr_accessible :idn, :dob, :fname, :lname, :client_id, :phone, :email
  
  has_many :courses, :through => :course_regs, :source => :course
  
  has_many :course_regs
  
  def name
    "#{self.fname} #{self.lname}"
  end
end
