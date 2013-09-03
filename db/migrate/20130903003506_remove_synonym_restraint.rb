class RemoveSynonymRestraint < ActiveRecord::Migration
  def change
    change_column :courses, :synonym, :integer, :null => true
  end
end
