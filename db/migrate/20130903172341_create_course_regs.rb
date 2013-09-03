class CreateCourseRegs < ActiveRecord::Migration
  def change
    create_table :course_regs do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :client_id

      t.timestamps
    end
  end
end
