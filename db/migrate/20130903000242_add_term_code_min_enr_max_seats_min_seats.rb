class AddTermCodeMinEnrMaxSeatsMinSeats < ActiveRecord::Migration
  def change
    add_column :terms, :code, :string, :null => false
    add_column :courses, :min_seats, :integer, :null => false
    rename_column :courses, :seats, :max_seats
  end
end
