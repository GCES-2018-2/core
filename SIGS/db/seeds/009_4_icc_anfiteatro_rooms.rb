@icc_anf_data = [
    ['27', 'ICC ANFI. 2', 120], ['35', 'ICC ANFI. 3', 160], ['43', 'ICC ANFI. 4', 247], ['51', 'ICC ANFI. 5', 120],
    ['60', 'ICC ANFI. 6', 120], ['78', 'ICC ANFI. 7', 145], ['78', 'ICC ANFI. 7', 145], ['86', 'ICC ANFI. 8', 165],
    ['108', 'ICC ANFI. 11', 171], ['183267', 'ICC ANFI. 12', 282], ['124', 'ICC ANFI. 13', 171], ['132', 'ICC ANFI. 14', 145],
    ['141', 'ICC ANFI. 15', 120], ['159', 'ICC ANFI. 16', 120], ['167', 'ICC ANFI. 17', 247], ['175', 'ICC ANFI. 18', 135],
    ['183', 'ICC ANFI. 19', 120]
]

puts "\t - Adding actual ICC ANFITEATRO rooms"
for data in @icc_anf_data do
    Room.create(code: data[0], name: data[1], capacity: data[2], active: true, time_grid_id: 1, department_id: 4, building_id: 9, category_ids: [2])
end