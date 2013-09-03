class CreateAttendanceRecords < ActiveRecord::Migration
  def change
    create_table :attendance_records do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :client_id
      t.float :hours
      t.date :date

      t.timestamps
    end
  end
end
