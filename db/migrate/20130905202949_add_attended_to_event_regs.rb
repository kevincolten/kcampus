class AddAttendedToEventRegs < ActiveRecord::Migration
  def change
    add_column :event_regs, :attended, :boolean, :default => false
  end
end
