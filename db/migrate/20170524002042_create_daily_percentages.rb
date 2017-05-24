class CreateDailyPercentages < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_percentages do |t|
      t.date :date
      t.integer :formal_assessment_percent
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
