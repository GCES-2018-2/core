class AddCoordinatorRefToSchoolRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :school_rooms, :coordinator, foreign_key: true
  end
end
