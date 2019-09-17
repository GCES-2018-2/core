# Courses
puts "Creating Courses"
course =     Course.find_or_create_by(code: '1228', name: 'Engenharia', department_id: 2, shift: 1)
course_2 =   Course.find_or_create_by(code: '1643', name: 'Engenharia Aeroespacial', department_id: 2, shift: 1)
course_3 =   Course.find_or_create_by(code: '1627', name: 'Engenharia Automotiva', department_id: 2, shift: 1)
course_4 =   Course.find_or_create_by(code: '1619', name: 'Engenharia de Energia', department_id: 2, shift: 1)
course_5 =   Course.find_or_create_by(code: '1635', name: 'Engenharia de Software', department_id: 2, shift: 1)
course_6 =   Course.find_or_create_by(code: '1601', name: 'Engenharia Eletrônica', department_id: 2, shift: 1)

# FCE courses
course_7 =    Course.find_or_create_by(code: '1244', name: 'Enfermagem', department_id: 5, shift: 1) 
course_8 = 	Course.find_or_create_by(code: '1236', name: 'Farmácia', department_id: 5, shift: 1)
course_9 = 	Course.find_or_create_by(code: '1252', name: 'Fisioterapia', department_id: 5, shift: 1)
course_10 = 	Course.find_or_create_by(code: '1571', name: 'Fonoaudiologia', department_id: 5, shift: 1)
course_11 = 	Course.find_or_create_by(code: '1279', name: 'Saúde Coletiva', department_id: 5, shift: 1)
course_12 = 	Course.find_or_create_by(code: '1261', name: 'Terapia Ocupacional', department_id: 5, shift: 1)