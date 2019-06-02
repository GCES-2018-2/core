# frozen_string_literal: true

# module to allocations
module AllocationHelper
    def search_resources_by_coordinator_rooms
        rooms_resources =[]
        categories = []
        resource = params[:resources_filter]    
        if @coordinator_rooms != nil
          if resource != ''
            puts "Recurso solicitado: " 
            puts resource  
            puts "Número de salas que pertencem ao coordenador: " 
            puts @coordinator_rooms.length
            @coordinator_rooms.each do |room|
              puts "Recurso da "  + room.name + ":"  
              room.category.each do |category|
                categories << category.name
                puts category.name
              end
              if categories.include?resource                         
                rooms_resources << room        
                puts "Número de salas que possui o recurso solicitado :" + rooms_resources.length.to_s
              else
                puts "Não tem " + resource
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
          rooms_capacity = @main_rooms #Possibilita pegar o vetor original de rooms
        end
        rooms_capacity
    end 
end
