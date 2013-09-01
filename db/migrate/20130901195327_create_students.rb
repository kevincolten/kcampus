class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :fname
      t.string :lname
      t.date :dob
      t.integer :datatel

      t.timestamps
    end
  end
end
