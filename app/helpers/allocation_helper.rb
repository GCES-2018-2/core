# frozen_string_literal: true

# module to allocations
module AllocationHelper

  def get_school_room_by_day_and_hour(room_id, day, hour)
    school_room_data = []
    allocation = Allocation.where(room_id: room_id, day: day, start_time: hour)
    if !allocation[0].nil?
      school_room = SchoolRoom.where(id: allocation[0].school_room_id)
      discipline = Discipline.where(id: school_room[0].discipline_id)
      school_room_data << discipline[0].name
      school_room_data << school_room[0].name
      return school_room_data
    else
      return nil
    end
  end

end
