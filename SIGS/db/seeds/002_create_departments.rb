# Departaments
puts "Creating Departaments"
department = Department.find_or_create_by(code: '789', name: 'Engenharia', wing: 'SUL', campus_id: 2)
department_2 = Department.find_or_create_by(code: '781', name: 'PRC', wing: 'SUL', campus_id: 1)
department_3 = Department.find_or_create_by(code: '156', name: 'Artes', wing: 'NORTE', campus_id: 1)
department_4 = Department.find_or_create_by(code: '001', name: 'Prefeitura', wing: 'CENTRAL', campus_id: 1)