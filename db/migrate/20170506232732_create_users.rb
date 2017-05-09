class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
