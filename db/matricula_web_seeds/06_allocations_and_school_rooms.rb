require 'progress_bar'

puts 'Fetching allocations and school rooms...'
@allocations_and_school_rooms =  MatriculaWeb::Seeder.allocations_and_school_rooms

bar = ProgressBar.new(@allocations_and_school_rooms.count)

@created_school_room_codes = []

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
        day: MatriculaWeb::Utils.day_to_string(@day),
        start_time: MatriculaWeb::Utils.hour_to_string(@start_time),
        final_time: MatriculaWeb::Utils.hour_to_string(@end_time),
        active: true
    )
end