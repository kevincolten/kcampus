class AddClientIdToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :client_id, :integer, :null => false
  end
end
