class Event < ActiveRecord::Base
  attr_accessible :client_id, :date, :location_id, :max_seats, :name, :time
end
