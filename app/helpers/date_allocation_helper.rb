# frozen_string_literal: true

# Categories module
module DateAllocationHelper
  def run_all_allocation_date(week_days, allocation, date, period)
    while date != period.final_date
      all_allocation_date = AllAllocationDate.new
      all_allocation_date.allocation_id = allocation.id

      week_days.each_with_index do |day, index|
        next unless allocation.day == day && date.wday == index + 1
        all_allocation_date.day = date
        all_allocation_date.save
        all_allocation_date = nil
      end
      date += 1
    end
  end

  def run_allocation(allocation, date, period, _solicitation)
    week_days = %w[Segunda Terca Quarta Quinta Sexta Sabado]
    run_all_allocation_date(week_days, allocation, date, period)
    allocation.save
  end

  def pass_to_all_allocations_helper(allocation)
    period = Period.find_by(period_type: 'Letivo')
    date = period.initial_date
    run_allocation(allocation, date, period, false)
  end

  def pass_to_all_solicitations_helper(allocation)
    period = Period.find_by(period_type: 'Letivo')
    date = period.initial_date
    run_allocation(allocation, date, period, true)
  end
end
