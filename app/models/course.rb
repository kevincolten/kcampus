class Course < ActiveRecord::Base
  attr_accessible :seats, :budget_code, :course_type_id, 
                  :end_time, :friday, :instructor_id, :location_id, 
                  :monday, :room_number, :saturday, :section, 
                  :start_time, :sunday, :synonym, :term_id, 
                  :thursday, :tuesday, :wednesday, :number
                    
  belongs_to :instructor
  
  belongs_to :location
  
  belongs_to :course_type
  
  belongs_to :term
                  
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
      s_days << day[0] unless day == "Thursday"
      s_days << day[0..1] if day == "Thursday"
    end
    s_days.join(", ")
  end
  
  def course_code
    str = "#{self.course_type.discipline}"
    str << "#{sprintf('%04d', self.course_type.level)}-"
    str << "#{sprintf('%03d', self.section)}"
  end
  
  def dept_code
    str = "#{self.term.semester[0]}"
    str << "#{self.term.year.to_s[-2..-1]}"
    str << "#{self.term.number}"
    str << "#{self.location.code}-"
    str << "#{sprintf('%02d', self.number)}"
  end
  
end
