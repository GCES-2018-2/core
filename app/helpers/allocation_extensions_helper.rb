# frozen_string_literal: true

require 'pp'

# module to allocation_extensions
module AllocationExtensionsHelper
  def search_schedule
    schedule_filter = params[:schedule_filter].to_s.to_time
    rooms_schedule = []
    if schedule_filter != '' && !schedule_filter.nil?
      allocations = Allocation.joins(:room)
                              .where(allocations: { start_time: schedule_filter })
      rooms_schedule = get_rooms(allocations)
    else
      rooms_schedule = @coordinator_rooms
    end
    rooms_schedule
  end

  def search_resources
    resource_filter = params[:resources_filter]
    rooms_resources = []
    categories = []
    if resource_filter != '' && !resource_filter.nil?
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

  def search_capacity
    range_filter = params[:capacity_filter]
    rooms_capacity = []
    if range_filter != '' && !range_filter.nil?
      @coordinator_rooms.each do |room|
        rooms_capacity = get_rooms_by_capacity(range_filter, room, rooms_capacity)
      end
    else
      rooms_capacity = @coordinator_rooms
    end
    rooms_capacity
  end

  def split_string(word)
    tokens = word.split('-')
    tokens
  end

  def get_rooms_by_capacity(range_filter, room, rooms_capacity)
    range = split_string(range_filter)
    if room.capacity >= range[0].to_i && room.capacity < range[1].to_i
      rooms_capacity << room
    end
    rooms_capacity
  end

  def get_rooms(allocations)
    checked_rooms = []
    checked = 0
    @coordinator_rooms.each do |room|
      check_alocated_room_id(allocations)
      checked_rooms << room if checked.zero?
    end
    checked_rooms
  end

  def check_alocated_room_id(allocations)
    allocations.each do |allocation|
      if allocation.room_id == room.id
        checked = 1
        break
      end
    end 
  end

  def search_days
    day_filter = params[:day_filter]
    rooms_days = []
    if day_filter != '' && !day_filter.nil?
      allocations = Allocation.joins(:room)
                              .where(allocations: { day: day_filter })
      rooms_days = get_rooms(allocations)
    else
      rooms_days = @coordinator_rooms
    end
    rooms_days
  end
end
