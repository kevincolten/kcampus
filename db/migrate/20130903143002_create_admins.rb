class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :fname
      t.string :lname
      t.integer :idn
      t.string :location_id
      t.string :phone
      t.string :email

      t.timestamps
    end
    add_index :admins, :email
  end
end
