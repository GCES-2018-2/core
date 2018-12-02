require 'json'
require 'progress_bar'

@rooms_json =  MatriculaWeb::Seeder.rooms
puts 'Fetching rooms...'
@rooms = JSON.parse(@rooms_json)

bar = ProgressBar.new(@rooms.count)

