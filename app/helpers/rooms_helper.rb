
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

  def get_room_categories_names(id)
    categories_id = Room.find_by(id: id).category_ids
    categories_names = []
    categories_id.each do |categ|
      category_name = Category.find_by(id: categ).name
      categories_names << category_name
    end
    categories_names
  end

  def get_room_details(id)
    Room.find_by(id: id).details
  end

  def get_rooms_by_department(departments)
    courses = Course.find_by(department_id: departments)
    rooms = Room.where(course_id: courses)
    rooms
  end
end
