class AddDateToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :date, :date
  end
end
