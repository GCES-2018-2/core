# Users - AdministrativeAssistant
puts "Creating Administrative Assistant Users"
user_5 = User.create(name: 'Wallacy Braz', email: 'adm@unb.br', cpf: '05012348888', registration: '1234588', active: 1, password: '123456')
administrative_assistant = AdministrativeAssistant.create(user: user_5)
user_6 = User.create(name: 'Carlos Aragon', email: 'adm2@unb.br', cpf: '05022248811', registration: '2224588', active: 0, password: '123456')
administrative_assistant_2 = AdministrativeAssistant.create(user: user_6)