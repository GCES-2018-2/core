class AddUserRefToSchoolRooms < ActiveRecord::Migration[5.0]
  def change
    add_reference :school_rooms, :user, foreign_key: true
  end
end
