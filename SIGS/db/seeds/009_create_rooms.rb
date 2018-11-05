# Rooms
puts "Creating Rooms"
room = Room.create(code: '124325', name: 'S10', capacity: 50, active: true, time_grid_id: 1, department_id: 3, building_id: 1, category_ids: [1])
room_2 = Room.create(code: '987653', name: 'SS', capacity: 40, active: false, time_grid_id: 2, department_id: 1, building_id: 2, category_ids: [1])
room_3 = Room.create(code: '987655', name: 'S9', capacity: 40, active: false, time_grid_id: 2, department_id: 2, building_id: 2, category_ids: [2])
room_4 = Room.create(code: '987654', name: 'S8', capacity: 80, active: true, time_grid_id: 1, department_id: 1, building_id: 1, category_ids: [2])
room_5 = Room.create(code: '987624', name: 'S1', capacity: 80, active: true, time_grid_id: 1, department_id: 2, building_id: 2, category_ids: [1])
room_6 = Room.create(code: '987644', name: 'S2', capacity: 80, active: true, time_grid_id: 1, department_id: 2, building_id: 2, category_ids: [1])
room_6 = Room.create(code: '987111', name: 'S4', capacity: 80, active: true, time_grid_id: 1, department_id: 2, building_id: 1, category_ids: [1])
