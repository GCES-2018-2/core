# Periods
puts "Creating Periods"
period = Period.find_or_create_by(period_type:'Alocação', initial_date: '10-01-2018', final_date: '01-02-2018')
period_2 = Period.find_or_create_by(period_type:'Ajuste', initial_date: '23-02-2018', final_date: '01-03-2018')
period_3 = Period.find_or_create_by(period_type:'Letivo', initial_date: '08-03-2018', final_date: '14-07-2018')
