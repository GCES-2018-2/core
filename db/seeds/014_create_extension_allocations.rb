# Extension Allocations
puts "Creating Extension Allocations"
allocation_extension_1 = AllocationExtension.find_or_create_by(user_id: 1, room_id: 1, start_time: '18:00:00', final_time: '19:00:00', inicial_date: '06-07-2017', final_date: '06-07-2017', periodicity: "Quinzenal")
