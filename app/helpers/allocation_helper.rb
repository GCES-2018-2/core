# frozen_string_literal: true

# module to allocations
module AllocationHelper
    def search_resources_by_coordinator_rooms
        rooms_resources =[]
        categories = []
        resource = params[:resources_filter]
        if @coordinator_rooms != nil
          if resource != ''
            @coordinator_rooms.each do |room|
              room.category.each do |category|
                categories << category.name
              end
              if categories.include?resource
                rooms_resources << room
              else
              end
              categories = []
            end
          else
            rooms_resources = @coordinator_rooms
          end
        else
          rooms_resources = @main_rooms
        end
        rooms_resources
    end

    def search_capacity_by_coordinator_rooms
        rooms_capacity =[]
        range = params[:capacity_filter]
        if @coordinator_rooms != nil
            if range != ''
            @coordinator_rooms.each do |room|
                if range=='0-50' && room.capacity < 50
                rooms_capacity << room
                elsif range=='50-100' && room.capacity >=50 && room.capacity < 100
                rooms_capacity << room
                elsif range=='100-150' && room.capacity >=100
                rooms_capacity << room
                end
            end
            else
            rooms_capacity = @coordinator_rooms
            end
        else 
            rooms_capacity = @main_rooms
        end
        rooms_capacity
    end

    def search_building_cordinator_rooms
        building = params[:building_filter]
        rooms_building = []

        if(@coordinator_rooms != nil)
            if building != ''
                @coordinator_rooms.each do |room|
                    if room.building_id == building.to_i
                        rooms_building << room
                    end
                end
            else
                rooms_building = @coordinator_rooms
            end
        else
            rooms_building = @main_rooms
        end
        rooms_building
    end

    def search_days_by_coordinator_rooms
        day = params[:day_filter]
        rooms_days = []
        allocations = []
        busy=0
        if(@coordinator_rooms != nil)
            if day != ''
                allocations = Allocation.joins(:room).where(allocations: {day: params[:day_filter]})
                @coordinator_rooms.each do |room|
                    busy=0
                    allocations.each do |allocation|
                        if allocation.room_id == room.id
                            busy = 1
                            break
                        end 
                    end
                    if busy == 0 
                        rooms_days << room
                    end
                end
            else
                rooms_days = @coordinator_rooms
            end
        else
            rooms_days = @main_rooms
        end
        rooms_days
    end

    def search_schedule_by_coordinator_rooms
        schedule = (params[:schedule_filter].to_s + ':00').to_time
        rooms_schedule = []
        allocations = []
        busy=0
        if(@coordinator_rooms != nil)
            if schedule != ''
                allocations = Allocation.joins(:room).where(allocations: {start_time: schedule})
                @coordinator_rooms.each do |room|
                    busy=0
                    allocations.each do |allocation|
                        if allocation.room_id == room.id
                            busy = 1
                            break
                        end 
                    end
                    if busy == 0 
                        rooms_schedule << room
                    end
                end
            else
                rooms_schedule = @coordinator_rooms
            end
        else
            rooms_schedule = @main_rooms
        end
        rooms_schedule
    end
end
