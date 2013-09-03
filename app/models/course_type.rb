class CourseType < ActiveRecord::Base
  attr_accessible :long_name, :short_name, :discipline, :level, :client_id
  
  has_many :courses
  
  def code
    str = "#{self.long_name} "
    str << "(#{self.discipline} - "
    str << "#{sprintf('%04d', self.level)})"
  end
end
