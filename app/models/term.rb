class Term < ActiveRecord::Base
  attr_accessible :add_drop_end, :end, :number, :reg_end, :reg_start, 
                  :semester, :start, :year
end
