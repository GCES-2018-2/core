# Users - Coordinator
puts "Creating Coordinator Users"
user = User.create(name: 'Caio Filipe', email: 'coordenador@unb.br', cpf: '05012345678', registration: '1234567', active: 1, password: '123456')
coordinator = Coordinator.find_or_create_by(user: user, course_id: 1)
user_2 = User.create(name: 'João Busche', email: 'coordenador2@unb.br', cpf: '05044448888', registration: '1234544', active: 0, password: '123456')
coordinator_2 = Coordinator.find_or_create_by(user: user_2, course_id: 2)
user_3 = User.create(name: 'Daniel Marques', email: 'coordenador3@unb.br', cpf: '05044348888', registration: '1234546', active: 1, password: '123456')
coordinator_3 = Coordinator.find_or_create_by(user: user_3, course_id: 2)