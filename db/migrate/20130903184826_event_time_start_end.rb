class EventTimeStartEnd < ActiveRecord::Migration
  def change
    rename_column :events, :time, :start
    add_column :events, :end, :time, :null => false
    add_column :events, :contact_name, :string, :null => false
    add_column :events, :contact_email, :string, :null => false
    add_column :events, :contact_phone, :string, :null => false
    add_column :events, :room, :string, :null => false
    add_column :events, :term_id, :integer, :null => false
  end
end
