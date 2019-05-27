@bsan_data = [
    ['183461', 'BSA N AT 29/41', 88], ['183462', 'BSA N AT 39/41', 88], ['183463', 'BSA N AT 49/41', 88],
    ['183464', 'BSA N AT 58/41', 88], ['183465', 'BSA N AT 60/41', 88], ['183470', 'BSA N A1 29/41', 88],
    ['183471', 'BSA N A1 39/41', 88], ['183472', 'BSA N A1 49/41', 88], ['183473', 'BSA N A1 58/41', 88],
    ['183474', 'BSA N A1 60/41', 88], ['183503', 'BSA N A1 07/8', 30], ['183514', 'BSA N A1 07/11', 12],
    ['183505', 'BSA N A1 07/19', 20], ['183468', 'BSA N A1 09/41', 88]
]

puts "\t - Adding actual BSAN rooms"
for data in @bsan_data do
    Room.create(code: data[0], name: data[1], capacity: data[2], active: true, time_grid_id: 1, department_id: 4, building_id: 4, category_ids: [2])
end