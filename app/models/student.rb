class Student < ActiveRecord::Base
  attr_accessible :idn, :dob, :fname, :lname, :client_id, :phone, :email
  
  has_many :courses, :through => :course_regs, :source => :course
  
  has_many :course_regs
  
  has_many :attendance_records
  
  # validates :idn, :presence => true
  # validates :fname, :presence => true
  # validates :lname, :presence => true
  # validates :client_id, :presence => true
  
  
  def name
    "#{self.lname}, #{self.fname}"
  end
  
  def attendance(term_id)
    courses = self.courses.select{ |course| course.term_id = term_id }
    averages = []
    term_attendance_records = self.attendance_records
    records = []
    unless attendance_records.empty?
      courses.each do |course|
        records = attendance_records.select{ |record| course.id == record.course_id}
        course_hours = records.map(&:hours).reduce(:+)
        averages << ((course_hours / records.length) / course.duration) unless records.empty?
      end
      return (averages.reduce(:+) / averages.length * 100).to_i unless records.empty?
    end
    0
  end

  def self.import(file, current_user)
    CSV.foreach(file.path, headers: true) do |row|
      data = row.to_hash
      data[:client_id] = current_user.client_id
      student = Student.find_by_idn_and_client_id(data["idn"],
                                                  data[:client_id])
      if student
        student.update_attributes(data)
        student.save!
      else
        Student.create!(data)
      end
    end
  end
end
