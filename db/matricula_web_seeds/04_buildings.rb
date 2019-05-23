require 'progress_bar'

puts "Fetching buildings..."
@buildings =  MatriculaWeb::Seeder.buildings

bar = ProgressBar.new(@buildings.count)

@buildings.each do |building|
    bar.increment!
    @code = building['sigla']
    @name = building['denominacao']
    Building.find_or_create_by(code: @code, name: @name, wing: '')
end