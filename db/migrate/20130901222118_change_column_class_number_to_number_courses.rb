class ChangeColumnClassNumberToNumberCourses < ActiveRecord::Migration
  def change
    rename_column :courses, :class_number, :number
  end
end
