class AddDayIdToActivity < ActiveRecord::Migration[5.0]
  def change
    add_reference :activities, :day, foreign_key: true
  end
end
