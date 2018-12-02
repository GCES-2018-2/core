require 'json'

@rooms_json =  MatriculaWeb::Seeder.rooms
@rooms = JSON.parse(@rooms_json)

