class CreateDayTivities < ActiveRecord::Migration[5.0]
  def change
    create_table :day_tivities do |t|
      t.references :day, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
