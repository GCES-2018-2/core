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

    def search_campus_by_coordinator_rooms
        campi = params[:campus_filter]
        rooms_campus = []
        if(@coordinator_rooms != nil)            
            if campi != ''
                #rooms_campus = @coordinator_rooms.where(department: Campus.find_by_id(params[:campus_filter]).departments)

                #@coordinator_rooms.each do |room|
                 #   puts room.inspect
                  #  if room.department_id 
                   #     rooms_campus << room
                    #end
                #end
            else
                rooms_campus = @coordinator_rooms
            end
        else
            rooms_campus = @main_rooms
        end
        rooms_campus
    end
end
