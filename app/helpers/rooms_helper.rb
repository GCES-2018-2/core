
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

  def filter_rooms_by_department(selected_rooms, main_rooms, params)
    department_filter = params
    rooms_department = []    
    if !selected_rooms.nil?
      if department_filter != '' && !department_filter.nil?
        selected_rooms.each do |room| 
          rooms_department << room if room.department_id == department_filter.to_i
        end
      else
        rooms_department = selected_rooms
      end
    else
      rooms_department = main_rooms
    end
    rooms_department
  end

  def filter_by_capacity
    return unless params[:capacity].present?
    @rooms = @rooms.where('capacity >= ?', params[:capacity])
  end

  def filter_by_buildings
    return unless params[:building_id].present?
    @rooms = @rooms.where(building_id: params[:building_id])
  end

  def filter_by_name
    return unless params[:name].present?
    @rooms = @rooms.where('rooms.name LIKE ?', "%#{params[:name]}%")
  end

  def filter_by_code
    return unless params[:code].present?
    @rooms = @rooms.where('rooms.code LIKE ?', "%#{params[:code]}%")
  end

  def filter_rooms_by_campus
    return unless params[:campus_id].present?
    @rooms = @rooms.where(department: Campus.find_by_id(params[:campus_id]).departments)
  end
end
