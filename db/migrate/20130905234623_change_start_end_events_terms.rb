class ChangeStartEndEventsTerms < ActiveRecord::Migration
  def change
    rename_column :terms, :start, :start_date
    rename_column :terms, :end, :end_date
    rename_column :events, :start, :start_time
    rename_column :events, :end, :end_time
  end
end
