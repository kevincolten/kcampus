class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :fname, :null => false
      t.string :lname, :null => false
      t.string :organization, :null => false
      t.string :email, :null => false
      t.string :phone, :null => false

      t.timestamps
    end
  end
end
