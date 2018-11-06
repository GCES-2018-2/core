# Disciplines
puts "Creating Disciplines"
discipline = Discipline.find_or_create_by(code: '876', name: 'Cálculo 3', department_id: 1)
discipline_2 = Discipline.find_or_create_by(code: '777', name: 'Cálculo 2', department_id: 1)
discipline_3 = Discipline.find_or_create_by(code: '773', name: 'Cálculo 1', department_id: 1)
discipline_4 = Discipline.find_or_create_by(code: '774', name: 'Artes Visuais', department_id: 3)