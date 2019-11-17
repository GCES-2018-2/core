# frozen_string_literal: true

# Solicitations module
module SolicitationsHelper
  def validate_status_room(room_solicitation)
    if !room_solicitation.room_id.nil?
      1
    else
      0
    end
  end

  def validade_room_for_approve(room, room_solicitation)
    if room_solicitation.room_id.nil?
      room.id
    else
      room_solicitation.room_id
    end
  end

  def validate_for_save_solicitation(solicitation)
    solicitation.status = 1
    return unless solicitation.save
    flash[:success] = 'Solicitação aprovada com successo'
    redirect_to solicitations_index_path
  end

  def pass_to_all_allocation_dates_aux(allocation)
    pass_to_all_solicitations_helper(allocation)
  end

  def update_room_status(room_solicitation)
    room_solicitation.update(justify: params[:justification],
                             responder_id: current_user,
                             response_date: Date.today,
                             status: 2)
  end

  def avaliable_rooms
    reservations = convert_params_to_hash(params[:allocations])
    reservations = group_solicitation(reservations)

    rooms = filter_rooms_for_school_room(params[:school_room], params[:course])

    course_room(rooms, reservations)
  end

  def course_room(rooms, reservations)
    avaliable_rooms_hash = []
    rooms.each do |room|
      next unless avaliable_room_day(reservations, room)
      avaliable_rooms_hash.push [room, room.building, room.course, room.category]
    end
    avaliable_rooms_hash
  end

  def solicitation_params
    params[:solicitation].permit(:courses, :justify, :school_room_id)
  end

  def save_in_period(solicitation, rooms, group)
    save_in_period_courses(solicitation, rooms, group)
    save(group, solicitation)
  end

  def save_in_period_courses(solicitation, rooms, group)
    group.each do |row|
      row.each do |room_solicitation|
        solicitation_room_build(room_solicitation, solicitation, rooms)
      end
    end
  end

  def solicitation_room_build(room_solicitation, solicitation, rooms)
    start = "#{room_solicitation[:start_time]}:00"
    final = "#{room_solicitation[:final_time]}:00"
    i = 0
    loop do
      course = params[:solicitation][:courses]
      course = rooms[i].course_id if course.nil?
      solicitation.room_solicitation
                  .build(
                    start: start,
                    final: final,
                    day: room_solicitation[:day],
                    room: rooms[i],
                    course_id: course
                  )
      i += 1
      break unless i < rooms.size
    end
  end
end
