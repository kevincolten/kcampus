class ClientId < ActiveRecord::Migration
  def change
    add_column :users, :client_id, :integer, :null => false
    add_column :instructors, :client_id, :integer, :null => false
    add_column :students, :client_id, :integer, :null => false
    add_column :locations, :client_id, :integer, :null => false
    add_column :terms, :client_id, :integer, :null => false
    add_column :course_types, :client_id, :integer, :null => false
    add_column :courses, :client_id, :integer, :null => false    
  end
end
