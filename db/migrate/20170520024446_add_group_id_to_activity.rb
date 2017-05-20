class AddGroupIdToActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :activities, :group, foreign_key: true
  end
end
