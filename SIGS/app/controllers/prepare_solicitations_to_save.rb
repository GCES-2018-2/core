# frozen_string_literal: true

# Module to Prepare Solicitations to persist in database
module PrepareSolicitationsToSave
  def group_solicitation(solicitations)
    group_room_solicitation = []
    weeks = %w[segunda terca quarta quinta sexta sabado]
    weeks.each do |day_of_week|
      rows = row_mount(day_of_week, solicitations)
      group_room_solicitation.push rows unless rows.size.zero?
    end
    group_room_solicitation
  end

  def row_mount(day_of_week, solicitations)
    rooms_soliciations = []
    time_range = (6..24)
    time_range.each_with_index do |time, index|
      solicitations_by_day = solicitations[day_of_week]
      next if solicitations_by_day
      solicitations_by_day_hour = solicitations_by_day[time.to_s]
      if !solicitations_by_day_hour.nil? && index.zero?
        rooms_soliciations.push(start_time: time,
                                final_time: time + 1,
                                day: day_of_week)
      elsif solicitations_by_day_hour.nil?
        rooms_soliciations.last[:final_time] += 1
      end
    end
    rooms_soliciations
  end
end
