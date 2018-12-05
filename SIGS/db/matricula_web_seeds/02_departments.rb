# # Departments are being created on demand in 03_disciplines.rb due to insuficient information from MatriculaWeb's API
# # The reuse of the code below is strongly recomended due to avoid reworking

# require 'json'
# require 'progress_bar'

# puts "Fetching departments..."
# @departments =  MatriculaWeb::Seeder.departments # The module MatriculaWeb does not contain the .departments method yet

# bar = ProgressBar.new(@departments.count)

# @departments.each do |department|
#       bar.increment!
#     # Insert department object in the database
# end