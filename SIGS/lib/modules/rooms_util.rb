  def notFinalDate(allocation, date, period)
    while date != period.final_date
      all_allocation_date = AllAllocationDate.new
      all_allocation_date.allocation_id = allocation.id
      %w[Segunda Terça Quarta Quinta Sexta Sabado].each_with_index do |day, index|
        next unless allocation.day == day && date.wday == index + 1
        all_allocation_date.day = date
        all_allocation_date.save
        all_allocation_date = nil
      end
      date += 1
    end
    allocation.save
  end
