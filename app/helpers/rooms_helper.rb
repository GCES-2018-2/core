
# frozen_string_literal: true

# rooms module
module RoomsHelper
  def get_room_name(id)
    Room.find_by(id: id).name
  end

  def get_room_capacity(id)
    Room.find_by(id: id).capacity
  end

  def get_room_building(id)
    room = Room.find_by(id: id)
    Building.find_by(id: room.building_id).name
  end
end
