# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Populate database with Matricula Web's data"
task :seedfrommw => [:environment] do
  puts "Attempting to populate with Matricula Web's data"
  Dir[File.join(Rails.root, 'db', 'matricula_web_seeds', '*.rb')].sort.each do |seed|
    load seed
  end  
end
