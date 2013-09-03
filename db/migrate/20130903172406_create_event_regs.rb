class CreateEventRegs < ActiveRecord::Migration
  def change
    create_table :event_regs do |t|
      t.integer :student_id
      t.integer :event_id
      t.integer :client_id

      t.timestamps
    end
  end
end
