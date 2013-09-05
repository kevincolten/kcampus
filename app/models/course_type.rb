class CourseType < ActiveRecord::Base
  attr_accessible :long_name, :short_name, :discipline, :level, :client_id
  
  has_many :courses
  
  validates :long_name, :presence => true
  validates :short_name, :presence => true
  validates :discipline, :presence => true
  validates :level, :presence => true
  validates :client_id, :presence => true
  
  def code
    str = "#{self.long_name} "
    str << "(#{self.discipline} - "
    str << "#{sprintf('%04d', self.level)})"
  end
end
