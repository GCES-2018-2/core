#SchoolRooms
puts "Creating School Rooms"
school_room = SchoolRoom.create(name:'A', discipline_id: 1, vacancies: 40, course_ids: [2])
school_room_2 = SchoolRoom.create(name:'B', discipline_id: 1, vacancies: 60, course_ids: [3])
school_room_3 = SchoolRoom.create(name:'C', discipline_id: 3, vacancies: 35, course_ids: [3])
school_room_4 = SchoolRoom.create(name:'D', discipline_id: 1, vacancies: 40, course_ids: [2])
school_room_5 = SchoolRoom.create(name:'AA', discipline_id: 4, vacancies: 40, course_ids: [4])
school_room_6 = SchoolRoom.create(name:'BB', discipline_id: 4, vacancies: 40, course_ids: [4])