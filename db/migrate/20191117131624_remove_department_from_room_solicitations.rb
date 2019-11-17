class RemoveDepartmentFromRoomSolicitations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :room_solicitations, :department, foreign_key: true
  end
end
