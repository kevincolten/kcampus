class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :fname
      t.string :lname
      t.integer :datatel
      t.integer :location_id
      t.string :phone
      t.string :email
      t.float :pay_rate

      t.timestamps
    end
  end
end
