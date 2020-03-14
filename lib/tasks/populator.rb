# require needed files
require './lib/tasks/helpers/stores'
require './lib/tasks/helpers/employees'
require './lib/tasks/helpers/assignments'

module Populator  
  include Populator::Stores
  include Populator::Employees
  include Populator::Assignments
end