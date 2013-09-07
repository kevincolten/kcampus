class AddAdminInstructorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :instructor, :boolean, :default => false
    change_column :users, :client, :boolean, :default => false
  end
end
