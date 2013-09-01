class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :term_id, :null => false
      t.string :code, :null => false
      t.integer :course_type_id, :null => false
      t.integer :instructor_id, :null => false
      t.integer :location_id, :null => false
      t.boolean :sunday, :null => false, :default => false
      t.boolean :monday, :null => false, :default => false
      t.boolean :tuesday, :null => false, :default => false
      t.boolean :wednesday, :null => false, :default => false
      t.boolean :thursday, :null => false, :default => false
      t.boolean :friday, :null => false, :default => false
      t.boolean :saturday, :null => false, :default => false
      t.string :room_number, :null => false
      t.integer :seats, :null => false
      t.integer :section, :null => false
      t.integer :synonym, :null => false
      t.integer :budget_code, :null => false
      t.time :start_time, :null => false
      t.time :end_time, :null => false
      t.integer :class_number, :null => false

      t.timestamps
    end
  end
end
