@icc_b1_data = [
    ['11266', 'ICC B1 242', 35], ['11274', 'ICC B1 244', 40], ['11282', 'ICC B1 251', 35],
    ['11304', 'ICC B1 254', 20], ['183506', 'ICC B1 378', 25]
]

puts "\t - Adding actual ICC B1 rooms"
for data in @icc_b1_data do
    Room.create(code: data[0], name: data[1], capacity: data[2], active: true, time_grid_id: 1, department_id: 4, building_id: 8, category_ids: [2])
end