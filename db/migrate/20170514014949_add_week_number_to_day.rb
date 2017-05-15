class AddWeekNumberToDay < ActiveRecord::Migration[5.0]
  def change
    add_column :days, :week_number, :integer
  end
end
