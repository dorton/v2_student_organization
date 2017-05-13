class AddCampusAreaIdToGroup < ActiveRecord::Migration[5.0]
  def change
    add_reference :groups, :campus_area, foreign_key: true
  end
end
