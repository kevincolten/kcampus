class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :code, :null => false
      t.string :name, :null => false
      t.string :address, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zipcode, :null => false
      t.string :contact_name, :null => false
      t.string :contact_phone, :null => false
      t.string :contact_email, :null => false

      t.timestamps
    end
  end
end
