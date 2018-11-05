# Buildings
puts "Creating Buildings"
buildings = Building.create([
  {code: 'pjc', name: 'Pavilhão João Calmon', wing: 'NORTE'},
  {code: 'PAT', name: 'Pavilhão Anísio Teixeira', wing: 'NORTE'},
  {code: 'BSAS', name: 'Bloco de Salas da Ala Sul', wing: 'SUL'},
  {code: 'BSAN', name: 'Bloco de Salas da Ala Norte', wing: 'NORTE'}
  ])