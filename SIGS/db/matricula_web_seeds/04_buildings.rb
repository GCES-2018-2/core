require 'json'
require 'progress_bar'

@buildings_json =  MatriculaWeb::Seeder.buildings
puts "Fetching buildings..."
@buildings = JSON.parse(@buildings_json)

bar = ProgressBar.new(@buildings.count)

@buildings.each do |building|
    @code = building['sigla']
    @name = building['denominacao']
    Building.find_or_create_by(code: @code, name: @name, wing: '')
    bar.increment!
end