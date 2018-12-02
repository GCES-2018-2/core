require 'json'
require 'progress_bar'

@allocations_and_school_rooms_json =  MatriculaWeb::Seeder.allocations_and_school_rooms
puts 'Fetching allocations and school rooms...'
@allocations_and_school_rooms = JSON.parse(@allocations_and_school_rooms_json)

bar = ProgressBar.new(@allocations_and_school_rooms.count)