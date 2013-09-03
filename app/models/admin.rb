class Admin < ActiveRecord::Base
  attr_accessible :email, :fname, :idn, :lname, :location_id, :phone
end
