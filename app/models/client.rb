class Client < ActiveRecord::Base
  attr_accessible :email, :fname, :lname, :organization, :phone
end
