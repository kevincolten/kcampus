class Student < ActiveRecord::Base
  attr_accessible :idn, :dob, :fname, :lname, :client_id, :phone, :email
  
  has_many :courses, :through => :course_regs, :source => :course
  
  has_many :course_regs
  
  has_many :attendance_records
  
  def name
    "#{self.fname} #{self.lname}"
  end
  
  def attendance
    averages = []
    attendance_records = self.attendance_records
    unless attendance_records.empty?
      self.courses.each do |course|
        records = attendance_records.select{ |record| course.id == record.course_id}
        course_hours = records.map(&:hours).reduce(:+)
        averages << ((course_hours / records.length) / course.duration)
      end
      return (averages.reduce(:+) / averages.length * 100).to_i
    end
    0
  end
end
