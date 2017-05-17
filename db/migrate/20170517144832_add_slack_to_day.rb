class AddSlackToDay < ActiveRecord::Migration[5.0]
  def change
    add_column :days, :slack_sent, :boolean, null: false, default: false
  end
end
