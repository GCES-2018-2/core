require 'json'

@buildings_json =  MatriculaWeb::Seeder.buildings
@buildings = JSON.parse(@buildings_json)