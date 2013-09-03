class UsersAdminToClient < ActiveRecord::Migration
  def change
    rename_column :users, :admin, :client
  end
end
