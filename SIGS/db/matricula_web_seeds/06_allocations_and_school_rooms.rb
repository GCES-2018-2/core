require 'progress_bar'

def matricula_web_hour_to_string(mw_hour)
    mw_hour_to_string = '%04i' % mw_hour
    hour = mw_hour_to_string[0, 2]
    minute = mw_hour_to_string[2, 3]
    second = '00'
    final_string = '%02i:%02i:%02i' % [hour.to_i, minute.to_i, second.to_i]
end

puts 'Fetching allocations and school rooms...'
@allocations_and_school_rooms =  MatriculaWeb::Seeder.allocations_and_school_rooms

bar = ProgressBar.new(@allocations_and_school_rooms.count)

@created_school_room_codes = []

@day_hash = {
    '1': 'Domingo',
    '2': 'Segunda',
    '3': 'Terça',
    '4': 'Quarta',
    '5': 'Quinta',
    '6': 'Sexta',
    '7': 'Sabado'
}

@allocations_and_school_rooms.each do |allocation_info|
    bar.increment!
    @discipline = Discipline.find_by(:code => allocation_info['codigo_disciplina'])
    next if @discipline == nil 
    @name = allocation_info['turma']
    @room = Room.find_by(:code => allocation_info['codigo_local']) 
    next if @room == nil

    @course = Course.find_or_create_by(code: '0', name: 'Não Disponível', department_id: Department.find_by(:name => 'Prefeitura').id, shift: 1)

    
    @school_room = SchoolRoom.find_by(
        name: @name,
        discipline_id: @discipline.id
    )
    if @school_room == nil
        @school_room = SchoolRoom.create(
            name: @name,
            discipline_id: @discipline.id,
            vacancies: @room.capacity,
            course_ids: [@course.id] # Due to MW limitations, it is not possible to link courses to a room
        )
    end

    @start_time = allocation_info['hora_inicio']
    @end_time = allocation_info['hora_fim']
    @day = allocation_info['hora_dia']

    @allocation = Allocation.find_or_create_by(
        user_id: 1,
        room_id:  @room.id,
        school_room_id: @school_room.id,
        day: @day_hash[@day.to_s],
        start_time: matricula_web_hour_to_string(@start_time),
        final_time: matricula_web_hour_to_string(@end_time),
        active: true
    )
end