class CreateGroupTivities < ActiveRecord::Migration[5.0]
  def change
    create_table :group_tivities do |t|
      t.references :group, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
