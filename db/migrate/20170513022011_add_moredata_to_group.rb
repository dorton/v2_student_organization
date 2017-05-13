class AddMoredataToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :activity_level, :integer
    add_column :groups, :one_on_one, :boolean
    add_column :groups, :ai_session, :boolean
  end
end
