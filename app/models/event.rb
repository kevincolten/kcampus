class Event < ActiveRecord::Base
  attr_accessible :client_id, :date, :location_id, :max_seats, 
                  :name, :start, :end, :room, :contact_name, 
                  :contact_phone, :contact_email, :term_id
                  
  validates :client_id, :presence => true
  validates :date, :presence => true
  validates :location_id, :presence => true
  validates :max_seats, :presence => true
  validates :name, :presence => true
  validates :start, :presence => true  
  validates :end, :presence => true
  validates :room, :presence => true
  validates :contact_name, :presence => true
  validates :contact_phone, :presence => true
  validates :contact_email, :presence => true
  validates :term_id, :presence => true
  
end
