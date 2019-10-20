class AddCourseRefToRooms < ActiveRecord::Migration[5.0]
  def change
    add_reference :rooms, :course, foreign_key: true
  end
end
