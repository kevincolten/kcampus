module CoursesHelper
  def avg_attendance(attendance_records, student, course)
    length = (course.end_time - course.start_time) / 3600
    student_records = attendance_records.select do |record|
      student.id = record.student_id
    end
    
    hours = student_records.map{ |record| record.hours }
    average = hours.reduce(:+) / length * 100
    "#{average.to_i}% attendance"
  end
end
