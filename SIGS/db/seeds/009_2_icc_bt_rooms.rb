@icc_bt_data = [
  ['353', 'ICC BT 006', 48], ['10693', 'ICC BT 012/62', 32], ['10715', 'ICC BT 012/63', 38], ['10707', 'ICC BT 016/62', 32],
  ['361', 'ICC BT 027', 58], ['370', 'ICC BT 048', 48], ['396', 'ICC BT 102', 48], ['10821', 'ICC BT 143', 48],
  ['418', 'ICC BT 168', 58], ['5541', 'ICC BT 192', 48], ['469', 'ICC BT 504', 48], ['485', 'ICC BT 552', 48],
  ['507', 'ICC BT 594', 48], ['515', 'ICC BT 620', 58], ['523', 'ICC BT 648', 48], ['183303', 'ICC BSS 665', 47]
]

puts "\t - Adding actual ICC BT rooms"

for data in @icc_bt_data do
  Room.create(code: data[0], name: data[1], capacity: data[2], active: true, time_grid_id: 1, department_id: 4, building_id: 8, category_ids: [2])
end