# Buildings
puts "Creating Buildings"
buildings = Building.create([
  {code: 'PJC', name: 'Pavilhão João Calmon', wing: 'NORTE'},
  {code: 'PAT', name: 'Pavilhão Anísio Teixeira', wing: 'NORTE'},
  {code: 'BSAS', name: 'Bloco de Salas da Ala Sul', wing: 'SUL'},
  {code: 'BSAN', name: 'Bloco de Salas da Ala Norte', wing: 'NORTE'},
  {code: 'ICC B1', name: 'Instituto Central de Ciências - B1', wing: ''},
  {code: 'ICC AT', name: 'Instituto Central de Ciências - AT', wing: ''},
  {code: 'BAES', name: 'Bloco Eudoro de Souza', wing: 'NORTE'},
  {code: 'ICC BT', name: 'Instituto Central de Ciências - BT', wing: ''},
  {code: 'ICC ANFITEATRO', name: 'Instituto Central de Ciências - Anfiteatros', wing: ''},
  {code: 'UAC', name: 'Unidade Acadêmica', wing: ''},
  {code: 'UED', name: 'Unidade de Ensino e Docência', wing: ''},
  {code: 'GALPÃO', name: 'Galpão', wing: ''},
  {code: 'FÓRUM', name: 'Fórum', wing: ''}
  ])
