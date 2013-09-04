class Event < ActiveRecord::Base
  attr_accessible :client_id, :date, :location_id, :max_seats, 
                  :name, :start, :end, :room, :contact_name, 
                  :contact_phone, :contact_email, :term_id
end
