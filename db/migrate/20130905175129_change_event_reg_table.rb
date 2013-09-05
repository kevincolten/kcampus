class ChangeEventRegTable < ActiveRecord::Migration
  def change
    remove_column :event_regs, :student_id
    add_column :event_regs, :fname, :string, :null => false
    add_column :event_regs, :lname, :string, :null => false
    add_column :event_regs, :dob, :date, :null => false
    add_column :event_regs, :idn, :integer, :null => true
  end
end
