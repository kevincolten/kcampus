class DeleteCodeCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :code
  end
end
