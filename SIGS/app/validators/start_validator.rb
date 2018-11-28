class StartValidator < ActiveModel::EachValidator
	
  def validate_each(record, attribute, value)
  	record.errors.add(:attribute, 'Horários Inválidos') if time_invalid(record, value)
    error_mensager = 'Alocação com horário não vago ou capacidade da sala cheia'
    record.errors.add(:attribute, error_mensager) if verify_time_shock_room_day(record, value)
  end

  def time_invalid(record, value)
    range = record.final.to_i - value.to_i
    (range < 1)
  end

  def verify_time_shock_room_day(record, value)
    return false if record.room.nil?
    allocations_room = Allocation.where(day: record.day, room_id: record.room_id)
    allocations_room.each do |allocation_room|
      return true if verify_time_shock(record, value, allocation_room)
    end
    false
  end

  def verify_time_shock(record, value, allocation_room)
    time_in_range?(value, allocation_room) || time_in_range?(record.final, allocation_room)
  end

  def time_in_range?(hour, allocation)
    start_interval = allocation.start_time.strftime('%H').to_i
    final_interval = allocation.final_time.strftime('%H').to_i
    hour >= start_interval && hour <= final_interval
  end
end
