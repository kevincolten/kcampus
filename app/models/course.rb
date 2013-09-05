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
    str = "#{self.course_type.discipline}-"
    str << "#{sprintf('%04d',course_type.level*100+1)}-"
    str << "#{sprintf('%03d', self.section)}"
  end
  
  def dept_code
    str = "#{self.term.semester[0]}"
    str << "#{self.term.year.to_s[-2..-1]}"
    str << "#{self.term.number}"
    str << "#{self.location.code}-"
    str << "#{sprintf('%02d', self.number)}"
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
    (self.term.start..self.term.end).to_a.select do |k| 
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
    return 0
  end  
end
