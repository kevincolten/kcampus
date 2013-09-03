class AddEmailPhoneToStudents < ActiveRecord::Migration
  def change
    add_column :students, :email, :string
    add_column :students, :phone, :string
  end
end
