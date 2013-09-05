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
  
  belongs_to :location
  
  has_many :event_regs
  
  has_many :students, :through => :event_regs, :source => :student
  
  def time
    str = "#{self.start.strftime('%l:%M%P')} -"
    str << "#{self.end.strftime('%l:%M%P')}"
  end
  
  def remaining_seats
    seats_taken = EventReg.find_all_by_event_id(self.id)
    self.max_seats - seats_taken.count
  end
end
