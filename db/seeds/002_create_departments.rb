# Departaments
puts "Creating Departaments"
department = Department.find_or_create_by(code: '789', name: 'Engenharia', campus_id: 2)
department_2 = Department.find_or_create_by(code: '781', name: 'PRC', campus_id: 1)
department_3 = Department.find_or_create_by(code: '156', name: 'Artes', campus_id: 1)
department_4 = Department.find_or_create_by(code: '001', name: 'Prefeitura', campus_id: 1)
department_5 = Department.find_or_create_by(code: '660', name: 'FCE', campus_id: 3)