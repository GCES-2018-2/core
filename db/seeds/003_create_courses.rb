# Courses
puts "Creating Courses"
course = Course.find_or_create_by(code: '10', name: 'Engenharia de Software', department_id: 1, shift: 1)
course_2 = Course.find_or_create_by(code: '12', name: 'Engenharia Eletrônica', department_id: 1, shift: 1)
course_3 = Course.find_or_create_by(code: '12', name: 'Engenharia Automotiva', department_id: 1, shift: 2)
course_4 = Course.find_or_create_by(code: '09', name: 'Artes Visuais', department_id: 2, shift: 2)