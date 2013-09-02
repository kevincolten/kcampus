class Student < ActiveRecord::Base
  attr_accessible :idn, :dob, :fname, :lname
end
