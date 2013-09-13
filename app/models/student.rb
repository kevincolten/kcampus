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
    student_hash = {}
    Student.find_all_by_client_id(current_user.client_id).each do |student|
      student_hash[student.attributes["idn"]] = student.attributes.delete_if do |key, value| 
        key == "id" || key == "created_at" || key == "updated_at"
      end
    end
    CSV.foreach(file.path, headers: true) do |row|
      data = row.to_hash
      existing_student = student_hash[data["idn"].to_i]
      data["client_id"] = current_user.client_id
      if existing_student
        existing_student["dob"] = existing_student["dob"].to_s
        existing_student["idn"] = existing_student["idn"].to_s
        existing_students << data if data != existing_student
        next
      end
      values << data.values
    end
    columns = data.keys
    ob_existing_students = existing_students.map{|student| Student.new(student)}
    Student.synchronize(ob_existing_students, keys = ["idn"])
    Student.import(columns, values) unless values.empty?
  end
end
