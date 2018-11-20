def find_allocation(room)
  room_id = room.id
  @allocations = Allocation.where(room_id: room_id)
  @allocations_extensions = AllocationExtension.where(room_id: room_id)
end

def make_rows(hour)
  @row = [hour.to_s + ':00 - ' + hour.to_s + ':59']
  %w[Segunda Terça Quarta Quinta Sexta Sabado].each do |day_of_week|
    allocations = Allocation.where(room_id: params[day_of_week]).where(day: day_of_week)
    allocations_start = allocations.where('DATE_FORMAT(start_time, "%H") <= ?', hour)
                                    .where('DATE_FORMAT(final_time, "%H") > ?', hour)
    make_cell(allocations_start, hour, Room.find(params[day_of_week].to_i))
  end
  @row
end
    
def make_cell(allocations_start, hour, room)
  cell = ''
  if allocations_start.size.zero?
    cell = ' '
  else
    cell = ''
    exist = false
    allocations_start.each do |allocation|
      cell += allocation.school_room.discipline.name unless exist
      cell += '<br>Turma:' + allocation.school_room.name
      exist = true
    end
  end
  data_allocation(cell, hour, room)
end
    
def data_allocation(cell, hour, room)
  data_allocation = []
  data_allocation.push cell
  data_allocation.push params[:school_room]
  data_allocation.push room.id
  data_allocation.push hour.to_s
  data_allocation.push((hour + 1).to_s)
  data_allocation.push SchoolRoom.find(params[:school_room]).courses.first.shift
  @row << data_allocation
end

def get_valid_allocations_params(params, group_allocation = [], valid = [])
  [:Segunda, :Terça, :Quarta, :Quinta, :Sexta, :Sábado].each do |day_of_week|
    exist = false
    ('6'..'22').to_a.each do |index|
      next if params[day_of_week][index].nil?
      if params[day_of_week][index][:active] == '1' && !exist
        group_allocation.push params[day_of_week][index]
        valid.push index
        valid.push day_of_week
        exist = true
      elsif params[day_of_week][index][:active] == '1'
        group_allocation.last[:final_time] = params[day_of_week][index][:final_time]
      else
        exist = false
      end
    end
  end
  group_allocation
end