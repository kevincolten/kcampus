class Student < ActiveRecord::Base
  attr_accessible :idn, :dob, :fname, :lname, :client_id, :phone, :email
  
  has_many :courses, :through => :course_regs, :source => :course
  
  has_many :course_regs
  
  has_many :attendance_records
  
  validates :idn, :presence => true
  validates :dob, :presence => true
  validates :fname, :presence => true
  validates :lname, :presence => true
  validates :client_id, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  
  
  def name
    "#{self.lname}, #{self.fname}"
  end
  
  def attendance(term_id)
    courses = self.courses.where('term_id = ?', term_id)
    averages = []
    attendance_records = self.attendance_records
    unless attendance_records.empty?
      courses.each do |course|
        records = attendance_records.select{ |record| course.id == record.course_id}
        course_hours = records.map(&:hours).reduce(:+)
        averages << ((course_hours / records.length) / course.duration) unless records.empty?
      end
      return (averages.reduce(:+) / averages.length * 100).to_i
    end
    0
  end
end
