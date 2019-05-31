require 'progress_bar'

puts "Fetching disciplines..."
@disciplines =  MatriculaWeb::Seeder.disciplines

bar = ProgressBar.new(@disciplines.count)

#   Due to insuficient information from MatriculaWeb's API, some adaptations are being made in this file
# to allow at least seed disciplines, rooms and allocations.

@disciplines.each do |discipline|
    bar.increment!
    @department_code = discipline['codigo_orgao']
    @name = discipline['denominacao']
    @code = discipline['codigo']
    @department = Department.find_by(:code => @department_code)

    unless @department != nil
        @campus = Campus.find_or_create_by(name: 'Darcy Ribeiro')
        @department = Department.find_or_create_by(code: @department_code, name: 'Prefeitura', wing: 'CENTRAL', campus_id: @campus.id)
    end

    Discipline.find_or_create_by(code: @code, name: @name, department_id: @department.id)
end
