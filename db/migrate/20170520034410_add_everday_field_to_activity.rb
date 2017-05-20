class AddEverdayFieldToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :everyday, :boolean, default: false, null: false
  end
end
