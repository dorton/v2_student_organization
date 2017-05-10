class AddCityIdToDay < ActiveRecord::Migration[5.0]
  def change
    add_reference :days, :city, foreign_key: true
  end
end
