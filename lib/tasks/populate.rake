namespace :db do
  desc 'Erase and fill database'
  # creating a rake task within db namespace called 'populate'
  # executing 'rake db:populate' will cause this script to run
  task :populate => :environment do
    require 'factory_bot_rails'
    require './lib/tasks/populator'
    include Populator

    # Step 0: Reset of the databases (restart from scratch)
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
    puts 'Reset the dev and test databases'

    # Step 1: Create stores
    all_stores = create_stores
    puts 'Created stores'

    # Step 2: Create admins and a manager assigned to each store
    create_admins
    puts 'Created Alex and Mark as admins'
    create_managers_and_assignments_for(all_stores)
    puts 'Created managers and assigned each to a store'

    # Step 3: Create 250 employees
    puts 'Start creating employees'
    all_employees = create_employees
    puts 'Created 250 employees'

    # Step 4: for each employee create some assignments
    puts 'Start creating assignments'
    create_assignments_for(all_employees)
    puts 'Created a set of assignments for each employee'


  end
end