class AddGroupIdToStudents < ActiveRecord::Migration[5.0]
  def change
    add_reference :students, :group, foreign_key: true
  end
end
