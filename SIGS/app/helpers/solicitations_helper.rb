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

    rooms = filter_rooms_for_school_room(params[:school_room], params[:department])

    department_room(rooms, reservations)
  end

  def department_room(rooms, reservations)
    avaliable_rooms_hash = []
    rooms.each do |room|
      next unless avaliable_room_day(reservations, room)
      avaliable_rooms_hash.push [room, room.building, room.department, room.category]
    end
    avaliable_rooms_hash
  end

  def solicitation_params
    params[:solicitation].permit(:departments, :justify, :school_room_id)
  end

  def save_in_period(solicitation, rooms, group)
    group.each do |row|
      row.each do |room_solicitation|
        start = "#{room_solicitation[:start_time]}:00"
        final = "#{room_solicitation[:final_time]}:00"
        i = 0
        loop do
          department = params[:solicitation][:departments]
          department = rooms[i].department_id if department.nil?
          solicitation.room_solicitation
                      .build(start: start, final: final, day: room_solicitation[:day],
                             room: rooms[i], department_id: department)
          i += 1
          break unless i < rooms.size
        end
      end
    end
    save(group, solicitation)
  end

  def return_wing(school_room)
    north = south = 0

    school_room.courses.each do |course|
      north += 1 if course.department.wing == 'NORTE'
      south += 1 if course.department.wing == 'SUL'
    end
    @wing = if north < south
              'SUL'
            elsif north > south
              'NORTE'
            else
              school_room.courses[0].department.wing
            end
  end
end
