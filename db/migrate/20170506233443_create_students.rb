class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.references :cohort, foreign_key: true
      t.references :specialization, foreign_key: true

      t.timestamps
    end
  end
end
