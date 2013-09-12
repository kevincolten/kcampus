class Term < ActiveRecord::Base
  attr_accessible :add_drop_end, :end_date, :number, :reg_end, :reg_start, 
                  :semester, :start_date, :year, :code, :client_id
                  
  validates :add_drop_end, :presence => true
  validates :end_date, :presence => true
  validates :number, :presence => true
  validates :reg_end, :presence => true
  validates :reg_start, :presence => true
  validates :semester, :presence => true
  validates :start_date, :presence => true
  validates :year, :presence => true
  validates :code, :presence => true
  validates :client_id, :presence => true
                  
  has_many :courses, dependent: :destroy
  
  def dept_code
    "#{self.semester[0]}#{self.year.to_s[-2..-1]}#{self.number}"
  end
  
  def reg_dates
    str = "#{self.reg_start.strftime("%m/%d/%Y")} - "
    str << "#{self.reg_end.strftime("%m/%d/%Y")}"
  end
  
  def dates
    str = "#{self.start_date.strftime("%m/%d/%Y")} - "
    str << "#{self.end_date.strftime("%m/%d/%Y")}"
  end
end
