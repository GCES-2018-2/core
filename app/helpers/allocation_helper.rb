# frozen_string_literal: true

# module to allocations
module AllocationHelper
  def get_school_room_by_day_and_hour(room_id, day, hour)
    allocation = Allocation.where(room_id: room_id, day: day, start_time: hour)
    return unless allocation.present?
    school_room_data = []
    school_room = SchoolRoom.where(id: allocation[0].school_room_id)
    discipline = Discipline.where(id: school_room[0].discipline_id)
    school_room_data << discipline[0].name
    school_room_data << school_room[0].name
    school_room_data
  end

  def cell_is_selected?(cell_allocation)
    cell_allocation[:active] == '1'
  end

  def first_of_day?(cell_allocation, exist)
    cell_is_selected?(cell_allocation) && !exist
  end

  def get_allocation(cell_allocation, exist, allocation_group)
    if first_of_day?(cell_allocation, exist)
      allocation_group.push cell_allocation
      exist = true
    elsif cell_is_selected?(cell_allocation) # two marked cells in sequence
      allocation_group.last[:final_time] = cell_allocation[:final_time] #compact in one allocation
    else
      exist = false
    end
    [allocation_group, exist]
  end
end
