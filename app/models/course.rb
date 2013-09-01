class Course < ActiveRecord::Base
  attr_accessible :available_seats, :budget_code_id, :code, :course_type_id, 
                  :end_date, :end_time, :friday, :instructor_id, :level, 
                  :location_id, :monday, :room_number, :saturday, :section, 
                  :start_date, :start_time, :sunday, :synonym, :term_id, 
                  :thursday, :tuesday, :wednesday
end
