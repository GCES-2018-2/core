class RemoveDepartmentFromRooms < ActiveRecord::Migration[5.0]
  def change
    remove_reference :rooms, :department, foreign_key: true
  end
end
