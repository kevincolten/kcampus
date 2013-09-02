class CourseType < ActiveRecord::Base
  attr_accessible :long_name, :short_name, :discipline, :level
  
  has_many :courses
end
