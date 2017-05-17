class AddRigorScoreToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :rigor_score, :integer
  end
end
