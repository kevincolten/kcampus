class DatatelToId < ActiveRecord::Migration
  def change
    rename_column :instructors, :datatel, :idn
    rename_column :students, :datatel, :idn
  end
end
