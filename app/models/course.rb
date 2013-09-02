class Course < ActiveRecord::Base
  attr_accessible :seats, :budget_code, :course_type_id, 
                  :end_time, :friday, :instructor_id, :location_id, 
                  :monday, :room_number, :saturday, :section, 
                  :start_time, :sunday, :synonym, :term_id, 
                  :thursday, :tuesday, :wednesday, :number
                  
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
  
end
