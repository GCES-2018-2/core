# # Campi are being created on demand in 03_disciplines.rb due to insuficient information from MatriculaWeb's API
# # The reuse of the code below is strongly recomended due to avoid reworking

# require 'progress_bar'

# puts "Fetching campi..."
# @campi =  MatriculaWeb::Seeder.campi # The module MatriculaWeb does not contain the .campi method yet

# bar = ProgressBar.new(@campi.count)

# @campi.each do |campus|
#       bar.increment!
#     # Insert campus object in the database
# end