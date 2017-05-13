class AddAllStudentsToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :add_all_students, :boolean
  end
end
