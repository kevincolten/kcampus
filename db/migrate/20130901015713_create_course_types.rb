class CreateCourseTypes < ActiveRecord::Migration
  def change
    create_table :course_types do |t|
      t.string :long_name, :null => false
      t.string :short_name, :null => false
      t.string :discipline, :null => false
      t.integer :level, :null => false

      t.timestamps
    end
  end
end
