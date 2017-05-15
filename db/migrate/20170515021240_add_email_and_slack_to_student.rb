class AddEmailAndSlackToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :email, :string
    add_column :students, :slack_username, :string
  end
end
