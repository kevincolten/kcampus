class Course < ActiveRecord::Base
  attr_accessible :max_seats, :min_seats, :budget_code, :course_type_id, 
                  :end_time, :friday, :instructor_id, :location_id, 
                  :monday, :room_number, :saturday, :section, 
                  :start_time, :sunday, :synonym, :term_id, 
                  :thursday, :tuesday, :wednesday, :number, :client_id
                    
  belongs_to :instructor
  
  belongs_to :location
  
  belongs_to :course_type
  
  belongs_to :term
  
  has_many :course_regs
  
  has_many :students, :through => :course_regs, :source => :student

  has_many :attendance_records, dependent: :destroy
  
  validates :min_seats, :presence => true
  validates :max_seats, :presence => true
  validates :budget_code, :presence => true
  validates :course_type_id, :presence => true
  validates :end_time, :presence => true
  validates :instructor_id, :presence => true
  validates :location_id, :presence => true
  validates :room_number, :presence => true
  validates :section, :presence => true
  validates :start_time, :presence => true
  validates :synonym, :presence => true
  validates :term_id, :presence => true
  validates :number, :presence => true
  validates :client_id, :presence => true
                  
  def self.to_csv(courses, options = {})
    columns = ["Term",
               "Section Start Date",
               "Section End Date",
               "Term Start and End Dates",
               "Registration Start and End Dates",
               "Add and Drop Dates",
               "Course Level",
               "Short Title",
               "Long Title",
               "Class Number",
               "Synonym",
               "Days",
               "Times",
               "No. Weeks",
               "Contact Hours",
               "Max Capacity",
               "Min Enrollment",
               "Instructor ID",
               "Instructor Name",
               "Location Code",
               "Location",
               "Budget Code",
               "Room"]

    attributes = ["term.code",
                  "term.start_date",
                  "term.end_date",
                  "term.dates",
                  "term.reg_dates",
                  "term.add_drop_end",
                  "course_type.level",
                  "course_type.short_name",
                  "course_type.long_name",
                  "course_code",
                  "synonym",
                  "small_days",
                  "times",
                  "num_weeks",
                  "contact_hours",
                  "max_seats",
                  "min_seats",
                  "instructor.idn",
                  "instructor.full_name",
                  "location.code",
                  "location.name",
                  "budget_code",
                  "room_number"]

    CSV.generate(options) do |csv|
      csv << columns
      courses.each do |course|
        array = attributes.map { |attribute| course.send(:eval, attribute) }
        csv << array
      end
    end
  end

  def course_days
    methods = [ :sunday, 
                :monday, 
                :tuesday, 
                :wednesday, 
                :thursday,
                :friday,
                :saturday ]
    days = []
    methods.each { |method| days << method.to_s.capitalize if self.send(method)}
    days
  end
  
  def small_days
    s_days = []
    course_days.each do |day|
      case day
        when "Sunday"
          s_days << "Su"
        when "Thursday"
          s_days << "Th"
        else
          s_days << day[0] 
      end
    end
    s_days.join(", ")
  end
  
  def course_code
    if self.course_type
      str = "#{self.course_type.discipline}-"
      str << "#{sprintf('%04d',self.course_type.level*100+1)}-"
      str << "#{sprintf('%03d', self.section)}"
    else
      "unnassigned"
    end
  end
  
  def dept_code
    if self.location && self.term
      str = "#{self.term.semester[0]}"
      str << "#{self.term.year.to_s[-2..-1]}"
      str << "#{self.term.number}"
      str << "#{self.location.code}-"
      str << "#{sprintf('%02d', self.number)}"
    else
      "unassigned"
    end
  end
  
  def dates
    array = []
    hash = { "Su" => 0, 
             "M"  => 1, 
             "T"  => 2, 
             "W"  => 3, 
             "Th" => 4, 
             "F"  => 5,
             "S"  => 6 }
    self.small_days.split(", ").each {|day| array << hash[day]}
    (self.term.start_date..self.term.end_date).to_a.select do |k| 
        array.include?(k.wday)
    end
  end
  
  def month_years
    month_years = {}
    self.dates.each do |date| 
      unless month_years.has_key?(Date::MONTHNAMES[date.month])
        month_years[Date::MONTHNAMES[date.month]] = date.year
      end
    end
    month_years
  end
  
  def duration
    (self.end_time - self.start_time) / 3600
  end
  
  def student_attendance(student)
    records = student.attendance_records.select do |record| 
      record.course_id == self.id
    end
    unless records.empty?    
      return (records.map(&:hours).reduce(:+) / records.length / self.duration * 100).to_i
    end
    0
  end  

  def ada
    daily_attendances = AttendanceRecord.where('course_id = ? AND hours > 0', self.id).map { |record| record.date }
    unless daily_attendances.empty?
      return (daily_attendances.count / daily_attendances.uniq.count)
    end
    0
  end

  def total_enrolled
    CourseReg.find_all_by_course_id(self.id).count
  end

  def times
    str = "#{self.start_time.strftime('%l:%M%P')} - "
    str << "#{self.end_time.strftime('%l:%M%P')}"
  end

  def num_weeks
    self.dates.map(&:cweek).uniq.count
  end

  def contact_hours
    self.dates.count * self.duration
  end

end
