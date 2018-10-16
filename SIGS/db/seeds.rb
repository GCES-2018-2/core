# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Campi
puts "Creating Campi"
campus = Campus.find_or_create_by(name: 'Darcy Ribeiro')
campus_2 = Campus.find_or_create_by(name: 'Gama')

# Departaments
puts "Creating Departaments"
department = Department.find_or_create_by(code: '789', name: 'Engenharia', wing: 'SUL', campus_id: campus_2.id)
department_2 = Department.find_or_create_by(code: '781', name: 'PRC', wing: 'SUL', campus_id: campus.id)
department_3 = Department.find_or_create_by(code: '156', name: 'Artes', wing: 'NORTE', campus_id: campus.id)
department_4 = Department.find_or_create_by(code: '001', name: 'Prefeitura', wing: 'CENTRAL', campus_id: campus.id)

# Courses
puts "Creating Courses"
course = Course.find_or_create_by(code: '10', name: 'Engenharia de Software', department: department, shift: 1)
course_2 = Course.find_or_create_by(code: '12', name: 'Engenharia Eletrônica', department: department, shift: 1)
course_3 = Course.find_or_create_by(code: '12', name: 'Engenharia Automotiva', department: department, shift: 2)
course_4 = Course.find_or_create_by(code: '09', name: 'Artes Visuais', department: department_3, shift: 2)

# Users - Coordinator
puts "Creating Coordinator Users"
user = User.create(name: 'Caio Filipe', email: 'coordenador@unb.br', cpf: '05012345678', registration: '1234567', active: 1, password: '123456')
coordinator = Coordinator.find_or_create_by(user: user, course: course_2)
user_2 = User.create(name: 'João Busche', email: 'coordenador2@unb.br', cpf: '05044448888', registration: '1234544', active: 0, password: '123456')
coordinator_2 = Coordinator.find_or_create_by(user: user_2, course: course_4)
user_3 = User.create(name: 'Daniel Marques', email: 'coordenador3@unb.br', cpf: '05044348888', registration: '1234546', active: 1, password: '123456')
coordinator_3 = Coordinator.find_or_create_by(user: user_3, course: course_4)

# Users - Deg
puts "Creating DEG Users"
user_3 = User.create(name: 'João Pedro', email: 'deg@unb.br', cpf: '05012349999', registration: '1234599', active: 1, password: '123456')
department_assistant = Deg.create(user: user_3)
user_4 = User.create(name: 'Ateldy Brasil', email: 'deg2@unb.br', cpf: '05022446688', registration: '1234333', active: 0, password: '123456')
department_assistant_2 = Deg.create(user: user_4)

# Users - AdministrativeAssistant
puts "Creating Administrative Assistant Users"
user_5 = User.create(name: 'Wallacy Braz', email: 'adm@unb.br', cpf: '05012348888', registration: '1234588', active: 1, password: '123456')
administrative_assistant = AdministrativeAssistant.create(user: user_5)
user_6 = User.create(name: 'Carlos Aragon', email: 'adm2@unb.br', cpf: '05022248811', registration: '2224588', active: 0, password: '123456')
administrative_assistant_2 = AdministrativeAssistant.create(user: user_6)

# Buildings
puts "Creating Buildings"
buildings = Building.create([
  {code: 'pjc', name: 'Pavilhão João Calmon', wing: 'NORTE'},
  {code: 'PAT', name: 'Pavilhão Anísio Teixeira', wing: 'NORTE'},
  {code: 'BSAS', name: 'Bloco de Salas da Ala Sul', wing: 'SUL'},
  {code: 'BSAN', name: 'Bloco de Salas da Ala Norte', wing: 'NORTE'},
  {code: 'ICC B1', name: 'Instituto Central de Ciências - B1', wing: ''},
  {code: 'ICC AT', name: 'Instituto Central de Ciências - AT', wing: ''},
  {code: 'BAES', name: 'Bloco Eudoro de Souza', wing: 'NORTE'},
  {code: 'ICC BT', name: 'Instituto Central de Ciências - BT', wing: ''},
  {code: 'ICC ANFITEATRO', name: 'Instituto Central de Ciências - Anfiteatros', wing: ''}
  ])

# Categories
puts "Creating Categories"
category = Category.find_or_create_by(name: 'Laboratório Químico')
category_2 = Category.find_or_create_by(name: 'Retroprojetor')

# Rooms
puts "Creating Rooms"
puts "\t - Adding dummy/fake rooms"
room = Room.create(code: '124325', name: 'S10', capacity: 50, active: true, time_grid_id: 1, department: department_3, building: buildings[1], category_ids: [category.id])
room_2 = Room.create(code: '987653', name: 'SS', capacity: 40, active: false, time_grid_id: 2, department: department, building: buildings[2], category_ids: [category.id])
room_3 = Room.create(code: '987655', name: 'S9', capacity: 40, active: false, time_grid_id: 2, department: department_2, building: buildings[2], category_ids: [category_2.id])
room_4 = Room.create(code: '987654', name: 'S8', capacity: 80, active: true, time_grid_id: 1, department: department, building: buildings[1], category_ids: [category_2.id])
room_5 = Room.create(code: '987624', name: 'S1', capacity: 80, active: true, time_grid_id: 1, department: department_2, building: buildings[2], category_ids: [category.id])
room_6 = Room.create(code: '987644', name: 'S2', capacity: 80, active: true, time_grid_id: 1, department: department_2, building: buildings[2], category_ids: [category.id])
room_6 = Room.create(code: '987111', name: 'S4', capacity: 80, active: true, time_grid_id: 1, department: department_2, building: buildings[1], category_ids: [category.id])
puts "\t - Adding actual ICC AT rooms"
rooms = Room.create([
  {code: '183225', name: 'ICC AT 077/8', capacity: 34, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183192', name: 'ICC AT 079/8', capacity: 36, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183276', name: 'ICC AT 082', capacity: 41, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183224', name: 'ICC AT 085/8', capacity: 46, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183266', name: 'ICC AT 086', capacity: 40, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183222', name: 'ICC AT 091/8', capacity: 46, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183183', name: 'ICC AT 092', capacity: 43, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183223', name: 'ICC AT 097/8', capacity: 25, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183182', name: 'ICC AT 098', capacity: 43, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183181', name: 'ICC AT 104', capacity: 43, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183234', name: 'ICC AT 114/7', capacity: 35, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183277', name: 'ICC AT 114/18', capacity: 45, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183235', name: 'ICC AT 118/7', capacity: 35, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183236', name: 'ICC AT 121/7', capacity: 35, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183237', name: 'ICC AT 127/7', capacity: 35, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183238', name: 'ICC AT 133/7', capacity: 35, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183184', name: 'ICC AT 144/8', capacity: 36, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183185', name: 'ICC AT 144/9', capacity: 45, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183186', name: 'ICC AT 151/8', capacity: 36, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183187', name: 'ICC AT 157/8', capacity: 36, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183174', name: 'ICC AT 158/19', capacity: 43, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183188', name: 'ICC AT 163/8', capacity: 36, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183175', name: 'ICC AT 164', capacity: 43, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183189', name: 'ICC AT 169/8', capacity: 36, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183176', name: 'ICC AT 170', capacity: 43, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
  {code: '183190', name: 'ICC AT 175/8', capacity: 39, active: true, time_grid_id: 1, department: department_4, building: buildings[5], category_ids: [category_2.id]},
])
puts "\t - Adding actual ICC BT rooms"
rooms_2 = Room.create([
  {code: '353', name: 'ICC BT 006', capacity: 48, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '10693', name: 'ICC BT 012/62', capacity: 32, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '10715', name: 'ICC BT 012/63', capacity: 38, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '10707', name: 'ICC BT 016/62', capacity: 32, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '361', name: 'ICC BT 027', capacity: 58, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '370', name: 'ICC BT 048', capacity: 48, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '396', name: 'ICC BT 102', capacity: 48, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '10821', name: 'ICC BT 143', capacity: 48, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '418', name: 'ICC BT 168', capacity: 58, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '5541', name: 'ICC BT 192', capacity: 48, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '469', name: 'ICC BT 504', capacity: 48, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '485', name: 'ICC BT 552', capacity: 48, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '507', name: 'ICC BT 594', capacity: 48, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '515', name: 'ICC BT 620', capacity: 58, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '523', name: 'ICC BT 648', capacity: 48, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
  {code: '183303', name: 'ICC BSS 665', capacity: 47, active: true, time_grid_id: 1, department: department_4, building: buildings[7], category_ids: [category_2.id]},
])
puts "\t - Adding actual ICC B1 rooms"
rooms_3 = Room.create([
  {code: '11266', name: 'ICC B1 242', capacity: 35, active: true, time_grid_id: 1, department: department_4, building: buildings[4], category_ids: [category_2.id]},
  {code: '11274', name: 'ICC B1 244', capacity: 40, active: true, time_grid_id: 1, department: department_4, building: buildings[4], category_ids: [category_2.id]},
  {code: '11282', name: 'ICC B1 251', capacity: 35, active: true, time_grid_id: 1, department: department_4, building: buildings[4], category_ids: [category_2.id]},
  {code: '11304', name: 'ICC B1 254', capacity: 20, active: true, time_grid_id: 1, department: department_4, building: buildings[4], category_ids: [category_2.id]},
  {code: '183506', name: 'ICC B1 378', capacity: 25, active: true, time_grid_id: 1, department: department_4, building: buildings[4], category_ids: [category_2.id]},
])
puts "\t - Adding actual ICC ANFITEATRO rooms"
rooms_4 = Room.create([
  {code: '27', name: 'ICC ANFI. 2', capacity: 120, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '35', name: 'ICC ANFI. 3', capacity: 160, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '43', name: 'ICC ANFI. 4', capacity: 247, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '51', name: 'ICC ANFI. 5', capacity: 120, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '60', name: 'ICC ANFI. 6', capacity: 120, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '78', name: 'ICC ANFI. 7', capacity: 145, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '86', name: 'ICC ANFI. 8', capacity: 165, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '108', name: 'ICC ANFI. 11', capacity: 171, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '183267', name: 'ICC ANFI. 12', capacity: 282, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '124', name: 'ICC ANFI. 13', capacity: 171, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '132', name: 'ICC ANFI. 14', capacity: 145, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '141', name: 'ICC ANFI. 15', capacity: 120, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '159', name: 'ICC ANFI. 16', capacity: 120, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '167', name: 'ICC ANFI. 17', capacity: 247, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '175', name: 'ICC ANFI. 18', capacity: 135, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
  {code: '183', name: 'ICC ANFI. 19', capacity: 120, active: true, time_grid_id: 1, department: department_4, building: buildings[8], category_ids: [category_2.id]},
])

# Disciplines
puts "Creating Disciplines"
discipline = Discipline.find_or_create_by(code: '876', name: 'Cálculo 3', department: department)
discipline_2 = Discipline.find_or_create_by(code: '777', name: 'Cálculo 2', department: department)
discipline_3 = Discipline.find_or_create_by(code: '773', name: 'Cálculo 1', department: department)
discipline_4 = Discipline.find_or_create_by(code: '774', name: 'Artes Visuais', department: department_3)

#SchoolRooms
puts "Creating School Rooms"
school_room = SchoolRoom.create(name:'A', discipline: discipline, vacancies: 40, courses: [course_2])
school_room_2 = SchoolRoom.create(name:'B', discipline: discipline, vacancies: 60, courses: [course_3])
school_room_3 = SchoolRoom.create(name:'C', discipline: discipline_3, vacancies: 35, courses: [course_3])
school_room_4 = SchoolRoom.create(name:'D', discipline: discipline, vacancies: 40, courses: [course_2])
school_room_5 = SchoolRoom.create(name:'AA', discipline: discipline_4, vacancies: 40, course_ids: [course_4.id])
school_room_6 = SchoolRoom.create(name:'BB', discipline: discipline_4, vacancies: 40, course_ids: [course_4.id])

# Periods
puts "Creating Periods"
period = Period.find_or_create_by(period_type:'Alocação', initial_date: '10-01-2018', final_date: '01-02-2018')
period_2 = Period.find_or_create_by(period_type:'Ajuste', initial_date: '23-02-2018', final_date: '01-03-2018')
period_3 = Period.find_or_create_by(period_type:'Letivo', initial_date: '08-03-2018', final_date: '14-07-2018')

# Allocations
puts "Creating Allocations"
allocation = Allocation.find_or_create_by(user_id: user.id, room_id: room.id, school_room_id: school_room_2.id, day: "Segunda", start_time: '14:00:00', final_time: '16:00:00', active: true)
allocation_2 = Allocation.find_or_create_by(user_id: user.id, room_id: room_2.id, school_room_id: school_room_2.id, day: "Quarta", start_time: '14:00:00', final_time: '16:00:00', active: true)
allocation_3 = Allocation.find_or_create_by(user_id: user.id, room_id: room_2.id, school_room_id: school_room_2.id, day: "Sexta", start_time: '14:00:00', final_time: '16:00:00', active: true)
allocation_4 = Allocation.find_or_create_by(user_id: user.id, room_id: room_2.id, school_room_id: school_room_3.id, day: "Segunda", start_time: '08:00:00', final_time: '10:00:00', active: true)
allocation_5 = Allocation.find_or_create_by(user_id: user.id, room_id: room_2.id, school_room_id: school_room_3.id, day: "Quarta", start_time: '08:00:00', final_time: '10:00:00', active: true)
allocation_6 = Allocation.find_or_create_by(user_id: user.id, room_id: room_2.id, school_room_id: school_room_3.id, day: "Sexta", start_time: '08:00:00', final_time: '10:00:00', active: true)
allocation_7 = Allocation.find_or_create_by(user_id: user.id, room_id: room_2.id, school_room_id: school_room_4.id, day: "Segunda", start_time: '10:00:00', final_time: '12:00:00', active: true)
allocation_8 = Allocation.find_or_create_by(user_id: user.id, room_id: room_2.id, school_room_id: school_room_4.id, day: "Quarta", start_time: '10:00:00', final_time: '12:00:00', active: true)
allocation_9 = Allocation.find_or_create_by(user_id: user.id, room_id: room_2.id, school_room_id: school_room_4.id, day: "Sexta", start_time: '10:00:00', final_time: '12:00:00', active: true)
allocation_10 = Allocation.find_or_create_by(user_id: user.id, room_id: room_4.id, school_room_id: school_room_5.id, day: "Terça", start_time: '10:00:00', final_time: '12:00:00', active: true)
allocation_11 = Allocation.find_or_create_by(user_id: user.id, room_id: room_4.id, school_room_id: school_room_6.id, day: "Terça", start_time: '10:00:00', final_time: '12:00:00', active: true)
allocation_10 = Allocation.find_or_create_by(user_id: user.id, room_id: room_4.id, school_room_id: school_room_5.id, day: "Quinta", start_time: '10:00:00', final_time: '12:00:00', active: true)
allocation_11 = Allocation.find_or_create_by(user_id: user.id, room_id: room_4.id, school_room_id: school_room_6.id, day: "Sexta", start_time: '10:00:00', final_time: '12:00:00', active: true)
allocation_12 = Allocation.find_or_create_by(user_id: user.id, room_id: room_4.id, school_room_id: school_room_6.id, day: "Quarta", start_time: '14:00:00', final_time: '18:00:00', active: true)

# Extension Allocations
puts "Creating Extension Allocations"
allocation_extension_1 = AllocationExtension.find_or_create_by(user_id: user.id, room_id: room.id, start_time: '18:00:00', final_time: '19:00:00', inicial_date: '06-07-2017', final_date: '06-07-2017', periodicity: "Quinzenal")

# Token and Secrets
SECRET ||= '$2a$10$reXHMgegkckEKlceQ.0S5u/L44tbhU46C8TCdSn8HOePlEvnGYTI.'
TOKEN ||= 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiQW5hIFBhdWxhIENoYXZlcyIsImVtYWlsIjoiYW5hcGF1bGEuY2hhdmVzQGdtYWlsLmNvbSJ9.2ZOfSu2AbDH6EdIblImBG5ciVoXogLlXvUaWJAz17qc'
SECRET_2 ||= '$2a$10$F1DO6yDclNdFPvzg7KG51.1Gk9cNWGA3CRvp6.D1PWArKlsev7QMG'
TOKEN_2 ||= 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiR3VzdGF2byBGcmVpcmUgT2xpdmVpcmEiLCJlbWFpbCI6ImZyZWlyZS5vbGl2ZWlyYUBob3RtYWlsLmNvbSJ9.vNfwaSxpdVosGsnaS06JWt9NtMoAkOqwnjWcIAnFCy4'
SECRET_3 ||= '$2a$10$OzJkJBid71H2SRlVxv71buTP2hHoDFe4dIqIV9QjWebYy222W4Uoa'
TOKEN_3 ||= 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiTWF0aGV1cyBGcmFuY2lzY28gZG9zIFNhbnRvcyIsImVtYWlsIjoibWF0aGV1cy1mcmFuY2lzY29AeWFob28uY29tIn0.-z3L4M7C5-7JYNeKv_UrKaRhEVtdtsP5ho3w66Xl6PM'

# API Users
puts "Creating API Users"
api_user = ApiUser.find_or_create_by(name: 'Ana Paula Chaves', email: 'anapaula.chaves@gmail.com', secret: SECRET, token: TOKEN, user: user_5)
api_user_2 = ApiUser.find_or_create_by(name: 'Gustavo Freire Oliveira', email: 'freire.oliveira@hotmail.com', secret: SECRET_2, token: TOKEN_2, user: user_5)
api_user_3 = ApiUser.find_or_create_by(name: 'Matheus Francisco dos Santos', email: 'matheus-francisco@yahoo.com', secret: SECRET_3, token: TOKEN_3, user: user)
