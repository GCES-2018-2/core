require 'json'
require 'progress_bar'

@rooms_json =  MatriculaWeb::Seeder.rooms
puts 'Fetching rooms...'
@rooms = JSON.parse(@rooms_json)

@buildings_json =  MatriculaWeb::Seeder.buildings
@buildings = JSON.parse(@buildings_json)

bar = ProgressBar.new(@rooms.count)

@rooms.each do |room|
    @code = room['codigo']
    @name = room['sigla']
    @capacity = room['capacidade']
    @department_code = room['codigo_orgao']
    @building_code = room['codigo_projecao']

    @building_info = @buildings.find {|building| building['codigo'] == @building_code }
    @building = Building.find_by(:code => @building_info['sigla'])
    @department = Department.find_by(:code => @department_code)

    unless @department != nil
        @campus = Campus.find_or_create_by(name: 'Darcy Ribeiro')
        @department = Department.find_or_create_by(code: @department_code, name: 'Prefeitura', wing: 'CENTRAL', campus_id: @campus.id)
    end

    Room.create(
        code: @code,
        name: @name,
        capacity: @capacity,
        active: true,
        time_grid_id: 1,
        department_id: @department.id,
        building_id: @building.id,
        category_ids: []
    )
    bar.increment!
end
