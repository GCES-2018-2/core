@icc_at_codes = [
    '183225', '183192', '183276', '183224', '183266', '183222', '183183', '183223',
    '183182', '183181', '183234', '183277', '183235', '183236', '183237', '183238',
    '183184', '183185', '183186', '183187', '183174', '183188', '183175', '183189',
    '183176'
]
@icc_at_names = [
    'ICC AT 077/8', 'ICC AT 079/8', 'ICC AT 082', 'ICC AT 085/8', 'ICC AT 086', 'ICC AT 091/8', 'ICC AT 092', 'ICC AT 097/8',
    'ICC AT 098', 'ICC AT 104', 'ICC AT 114/7', 'ICC AT 114/18', 'ICC AT 118/7', 'ICC AT 121/7', 'ICC AT 127/7', 'ICC AT 133/7',
    'ICC AT 144/8', 'ICC AT 144/9', 'ICC AT 151/8', 'ICC AT 157/8', 'ICC AT 158/19', 'ICC AT 163/8', 'ICC AT 164', 'ICC AT 169/8',
    'ICC AT 170'
]
@icc_at_capacities = [
    34, 36, 41, 46, 40, 46, 43, 25,
    43, 43, 35, 45, 35, 35, 35, 35,
    36, 45, 36, 36, 43, 36, 43, 36,
    43
]

puts "\t - Adding actual ICC AT rooms"
for index in (0..(@icc_at_codes.count - 1)) do
    Room.create(code: @icc_at_codes[index], name: @icc_at_names[index], capacity: @icc_at_capacities[index], active: true, time_grid_id: 1, department_id: 4, building_id: 6, category_ids: [2])
end


