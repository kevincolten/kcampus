class Location < ActiveRecord::Base
  attr_accessible :address, :city, :code, :contact_email, :contact_name, :contact_phone, :name, :state, :zipcode
end
