class AttendanceRecord < ActiveRecord::Base
  attr_accessible :client_id, :course_id, :date, :hours, :student_id
  
  belongs_to :student
  
  belongs_to :course
  
  validates :client_id, :presence => true
  validates :course_id, :presence => true
  validates :student_id, :presence => true
  validates :date, :presence => true
  validates :hours, :presence => true
  
  def self.dates(attendance_records)
    attendance_records.map { |record| record.date }.uniq.sort
  end

  def self.to_csv(attendance_records, course, students)
    dates = AttendanceRecord.dates(attendance_records)
    columns = dates.map{ |date| date.day }
    columns.unshift("")
    CSV.generate do |csv|
      csv << columns
      students.each do |student|
        array = []
        array << student.name
        dates.each do |date|
          found = attendance_records.select do |record|
            student.id == record.student_id && record.date == date
          end
          array << found.first.hours unless found.empty?
        end
        csv << array
      end
    end

  end

end