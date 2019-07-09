# frozen_string_literal: true

require 'pp'

# rubocop:disable ModuleLength
# module to allocation_extensions
module FiltersRoomsExtensionsHelper
  # Method search rooms by schedule (time) and return free rooms
  def search_schedule
    schedule_filter = params[:schedule_filter].to_s.to_time
    rooms_schedule = []
    if param_is_not_empty(schedule_filter)
      allocations = Allocation.joins(:room)
                              .where(allocations: { start_time: schedule_filter })
      rooms_schedule = get_rooms(allocations)
    else
      rooms_schedule = @coordinator_rooms
    end
    rooms_schedule
  end

  def search_resources
    resource_filter = params[:resources_name]
    rooms_resources = []
    categories = []
    if param_is_not_empty(resource_filter)
      @coordinator_rooms.each do |room|
        room.category.each do |category|
          categories << category.name
        end
        rooms_resources << room if categories.include?resource_filter
        categories = []
      end
    else
      rooms_resources = @coordinator_rooms
    end
    rooms_resources
  end

  def search_capacity(params, selected_rooms)
    range_filter = params
    rooms_capacity = []
    if param_is_not_empty(range_filter)
      selected_rooms.each do |room|
        rooms_capacity = get_rooms_by_capacity(range_filter, room, rooms_capacity)
      end
    else
      rooms_capacity = selected_rooms
    end
    rooms_capacity
  end

  # Method split string of filter rooms by capacity
  def split_string(filter)
    filter.split('-')
  end

  # Method get rooms in range of capacity
  def get_rooms_by_capacity(range_filter, room, rooms_capacity)
    range = split_string(range_filter)
    if room.capacity >= range[0].to_i && room.capacity < range[1].to_i
      rooms_capacity << room
    end
    rooms_capacity
  end

  def param_is_not_empty(parameter)
    parameter != '' && !parameter.nil?
  end

  # Method get free rooms, used for times and days
  def get_rooms(allocations)
    checked_rooms = []
    checked = 0
    @coordinator_rooms.each do |room|
      checked = 0
      allocations.each do |allocation|
        if allocation.room_id == room.id
          checked = 1
          break
        end
      end
      checked_rooms << room if checked.zero?
    end
    checked_rooms
  end

  def search_building(selected_rooms, building_id)
    rooms_building = []
    if param_is_not_empty(building_id)
      selected_rooms.each do |room|
        rooms_building << room if room.building_id == building_id.to_i
      end
    else
      rooms_building = selected_rooms
    end
    rooms_building
  end

  def search_rooms(selected_rooms, room_id)
    rooms = []
    if param_is_not_empty(room_id)
      selected_rooms.each do |room|
        rooms << room if room.id == room_id.to_i
      end
    else
      rooms = selected_rooms
    end
    rooms
  end

  def search_days
    day_name = params[:day_name]
    rooms_days = []
    if param_is_not_empty(day_name)
      allocations = Allocation.joins(:room)
                              .where(allocations: { day: day_name })
      rooms_days = get_rooms(allocations)
    else
      rooms_days = @coordinator_rooms
    end
    rooms_days
  end

  def search_code(selected_rooms, room_code)
    rooms = []
    if param_is_not_empty(room_code)
      selected_rooms.each do |room|
        rooms << room if room.code == room_code
      end
    else
      rooms = selected_rooms
    end
    rooms
  end

  def search_department(selected_rooms, department_filter)
    rooms_department = []
    if param_is_not_empty(department_filter)
      selected_rooms.each do |room|
        rooms_department << room if room.department_id == department_filter.to_i
      end
    else
      rooms_department = selected_rooms
    end
    rooms_department
  end

  def search_campus(selected_rooms, campus_id)
    rooms = if param_is_not_empty(campus_id)
              selected_rooms.where(department: Campus.find_by_id(campus_id)
                                            .departments)
            else
              selected_rooms
            end
    rooms
  end
end
