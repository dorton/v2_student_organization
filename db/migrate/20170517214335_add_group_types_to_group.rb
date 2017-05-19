class AddGroupTypesToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :advancement, :boolean, null: false, default: false
    add_column :groups, :remediation, :boolean, null: false, default: false
  end
end
