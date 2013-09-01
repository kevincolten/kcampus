class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.integer :year, :null => false
      t.string :semester, :null => false
      t.integer :number, :null => false
      t.date :start, :null => false
      t.date :end, :null => false
      t.date :reg_start, :null => false
      t.date :reg_end, :null => false
      t.date :add_drop_end, :null => false

      t.timestamps
    end
  end
end
