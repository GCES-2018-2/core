class AddCourseRefToRoomSolicitations < ActiveRecord::Migration[5.2]
  def change
    add_reference :room_solicitations, :course, foreign_key: true
  end
end
