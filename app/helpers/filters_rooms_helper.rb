# frozen_string_literal: true

# module to allocations
module FiltersRoomsHelper
  include FiltersRoomsExtensionsHelper
  def search_rooms_by_resources
    rooms_resources = if !@coordinator_rooms.nil?
                        search_resources
                      else
                        @main_rooms
                      end
    rooms_resources
  end

  def search_rooms_by_capacity(selected_rooms, main_rooms, params)
    room_capacities = if !selected_rooms.nil?
                        search_capacity(params, selected_rooms)
                      else
                        main_rooms
                      end
    room_capacities
  end

  def search_rooms_by_building(selected_rooms, main_rooms, building_id)
    rooms_building = []
    if !selected_rooms.nil?
      if building_id != '' && !building_id.nil?
        selected_rooms.each do |room|
          rooms_building << room if room.building_id == building_id.to_i
        end
      else
        rooms_building = selected_rooms
      end
    else
      rooms_building = main_rooms
    end
    rooms_building
  end

  def search_rooms_by_day
    room_days = if !@coordinator_rooms.nil?
                  search_days
                else
                  @main_rooms
                end
    room_days
  end

  def search_rooms_by_schedule
    room_schedule = if !@coordinator_rooms.nil?
                      search_schedule
                    else
                      @main_rooms
                    end
    room_schedule
  end

  def search_rooms_by_name(selected_rooms, main_rooms, room_id)
    rooms = []
    if !selected_rooms.nil?
      if room_id != '' && !room_id.nil?
        selected_rooms.each do |room|
          rooms << room if room.id == room_id.to_i
        end
      else
        rooms = selected_rooms
      end
    else
      rooms = main_rooms
    end
    rooms
  end

  def search_rooms_by_code(selected_rooms, main_rooms, room_code)
    room_code = if !selected_rooms.nil?
                  search_code(selected_rooms, room_code)
                else
                  main_rooms
                end
    room_code
  end

  def search_rooms_by_department(selected_rooms, main_rooms, department_filter)
    rooms_departments = if !selected_rooms.nil?
                          search_department(selected_rooms, department_filter)
                        else
                          main_rooms
                        end
    rooms_departments
  end

  def search_rooms_by_campus(selected_rooms, main_rooms, campus_id)
    room_campus = if !selected_rooms.nil?
                    search_campus(selected_rooms, campus_id)
                  else
                    main_rooms
                  end
    room_campus
  end
end
