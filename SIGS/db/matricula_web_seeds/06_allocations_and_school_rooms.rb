require 'json'

@allocations_and_school_rooms_json =  MatriculaWeb::Seeder.allocations_and_school_rooms
@allocations_and_school_rooms = JSON.parse(@allocations_and_school_rooms_json)