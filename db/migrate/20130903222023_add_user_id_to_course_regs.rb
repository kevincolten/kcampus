class AddUserIdToCourseRegs < ActiveRecord::Migration
  def change
    add_column :course_regs, :user_id, :integer, :null => false
  end
end
