class AddCourseRefToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :course, foreign_key: true
  end
end
