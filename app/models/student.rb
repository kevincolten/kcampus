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

  def self.import_CSV(file, current_user)
    values = []
    data = nil
    existing_students = []
    students = Student.find_all_by_client_id(current_user.client_id)
    CSV.foreach(file.path, headers: true) do |row|
      data = row.to_hash
      existing_student = students.select{ |student| student.idn == data["idn"].to_i }.first
      if existing_student
        existing_students << existing_student
        next
      end
      data[:client_id] = current_user.client_id
      values << data.values
    end
    columns = data.keys.map{ |key| key.to_sym }
    Student.synchronize(existing_students, keys = ["idn"])
    Student.import(columns, values) unless values.empty?

      # student = Student.find_by_idn_and_client_id(data["idn"],
      #                                             data[:client_id])
      # if student
      #   student.update_attributes(data)
      #   student.save!
      # else
      #   Student.create!(data)
      # end
  end
end
