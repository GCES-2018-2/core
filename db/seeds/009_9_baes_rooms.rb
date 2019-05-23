@baes_data = [
    ['183252', 'BAES AT 11/31', 33], ['183253', 'BAES AT 11/36', 34], ['183254', 'BAES AT 11/53', 46],
    ['183255', 'BAES AT 11/55', 46], ['183256', 'BAES AT 13/61', 63], ['183251', 'BAES A1 11/19', 22],
    ['183257', 'BAES A1 11/23', 22], ['183258', 'BAES A1 11/27', 22], ['183259', 'BAES A1 11/31', 22],
    ['183260', 'BAES A1 11/33', 34], ['183261', 'BAES A1 11/49', 22], ['183262', 'BAES A1 11/53', 22],
    ['183263', 'BAES A1 11/57', 22], ['183264', 'BAES A1 11/58', 22], ['183265', 'BAES A1 13/61', 63]
]

puts "\t - Adding actual BAES rooms"
for data in @baes_data do
    Room.create(code: data[0], name: data[1], capacity: data[2], active: true, time_grid_id: 1, department_id: 4, building_id: 7, category_ids: [2])
end