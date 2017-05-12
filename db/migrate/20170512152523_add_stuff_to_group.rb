class AddStuffToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :start_time, :time
    add_column :groups, :end_time, :time
    add_column :groups, :description, :string
    add_column :groups, :review, :boolean
  end
end
