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

  def search_rooms_by_building(selected_rooms, main_rooms, params)
    building_filter = params
    rooms_building = []    
    if !selected_rooms.nil?
      if building_filter != '' && !building_filter.nil?
        selected_rooms.each do |room|          
          rooms_building << room if room.building_id == building_filter.to_i
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

  def search_room_by_name(selected_rooms, main_rooms, params)
    room_filter = params
    rooms = []

    if !selected_rooms.nil?
      if room_filter != '' && !room_filter.nil?
        selected_rooms.each do |room|
          rooms << room if room.id == room_filter.to_i
        end
      else
        rooms = selected_rooms
      end
    else
      rooms = main_rooms
    end
    rooms
  end
end
