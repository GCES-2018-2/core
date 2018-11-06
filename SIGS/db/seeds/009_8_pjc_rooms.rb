@pjc_data = [
    ['183512', 'PJC BT 005', 50], ['182513', 'PJC BT 019', 50], ['182628', 'PJC BT 012', 50],
    ['182630', 'PJC BT 020', 50], ['182631', 'PJC BT 021', 50], ['182632', 'PJC BT 028', 50],
    ['182633', 'PJC BT 029', 50], ['182634', 'PJC BT 036', 50], ['182669', 'PJC BT 044', 37],
    ['182638', 'PJC BT 053', 50], ['182639', 'PJC BT 060', 50], ['182640', 'PJC BT 061', 50],
    ['182641', 'PJC BT 068', 50], ['182642', 'PJC BT 069', 50], ['182643', 'PJC BT 076', 50],
    ['182644', 'PJC BT 077', 50], ['182647', 'PJC BT 085', 50], ['182648', 'PJC BT 092', 50],
    ['182649', 'PJC BT 093', 50], ['182650', 'PJC BT 100', 50], ['182651', 'PJC BT 101', 50],
    ['182652', 'PJC BT 108', 50], ['182655', 'PJC BT 116', 50], ['182656', 'PJC BT 117', 50],
    ['182657', 'PJC BT 124', 50], ['182658', 'PJC BT 125', 50], ['182659', 'PJC BT 132', 50],
    ['183509', 'PJC BT 133', 50], ['183510', 'PJC BT 147', 50], ['182661', 'PJC BT 140', 50],
    ['182663', 'PJC BT 148', 50]
]

puts "\t - Adding actual PJC rooms"
for data in @pjc_data do
    Room.create(code: data[0], name: data[1], capacity: data[2], active: true, time_grid_id: 1, department_id: 4, building_id: 1, category_ids: [2])
end