class AddIndices < ActiveRecord::Migration
  def change
    add_index :admins, :location_id
    add_index :admins, :client_id
    add_index :attendance_records, :student_id
    add_index :attendance_records, :course_id
    add_index :attendance_records, :client_id
    add_index :course_regs, :student_id
    add_index :course_regs, :course_id
    add_index :course_regs, :client_id
    add_index :course_types, :client_id
    add_index :courses, :term_id
    add_index :courses, :course_type_id
    add_index :courses, :instructor_id
    add_index :courses, :location_id
    add_index :courses, :client_id
    add_index :event_regs, :event_id
    add_index :event_regs, :client_id
    add_index :events, :location_id
    add_index :events, :client_id
    add_index :events, :term_id
    add_index :instructors, :location_id
    add_index :instructors, :client_id
    add_index :locations, :client_id
    add_index :students, :client_id
    add_index :terms, :client_id
    add_index :users, :client_id
  end
end
