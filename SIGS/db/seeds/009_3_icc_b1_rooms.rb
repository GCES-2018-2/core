puts "\t - Adding actual ICC B1 rooms"
rooms_3 = Room.create([
  {code: '11266', name: 'ICC B1 242', capacity: 35, active: true, time_grid_id: 1, department_id: 4, building_id: 8, category_ids: [2]},
  {code: '11274', name: 'ICC B1 244', capacity: 40, active: true, time_grid_id: 1, department_id: 4, building_id: 8, category_ids: [2]},
  {code: '11282', name: 'ICC B1 251', capacity: 35, active: true, time_grid_id: 1, department_id: 4, building_id: 8, category_ids: [2]},
  {code: '11304', name: 'ICC B1 254', capacity: 20, active: true, time_grid_id: 1, department_id: 4, building_id: 8, category_ids: [2]},
  {code: '183506', name: 'ICC B1 378', capacity: 25, active: true, time_grid_id: 1, department_id: 4, building_id: 8, category_ids: [2]},
])