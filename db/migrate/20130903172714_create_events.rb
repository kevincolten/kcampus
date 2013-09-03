class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.integer :max_seats
      t.integer :location_id
      t.time :time
      t.integer :client_id

      t.timestamps
    end
  end
end
