# Users - Deg
puts "Creating DEG Users"
user_3 = User.create(name: 'João Pedro', email: 'deg@unb.br', cpf: '05012349999', registration: '1234599', active: 1, password: '123456')
department_assistant = Deg.create(user: user_3)
user_4 = User.create(name: 'Ateldy Brasil', email: 'deg2@unb.br', cpf: '05022446688', registration: '1234333', active: 0, password: '123456')
department_assistant_2 = Deg.create(user: user_4)