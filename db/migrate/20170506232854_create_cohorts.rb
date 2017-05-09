class CreateCohorts < ActiveRecord::Migration[5.0]
  def change
    create_table :cohorts do |t|
      t.date :start_date
      t.date :end_date
      t.string :course_name
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
