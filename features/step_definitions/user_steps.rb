require './test/contexts'
include Contexts

Given /^an initial setup$/ do
  # context used for phase 3 only
  create_employees
  create_stores
  create_assignments
  # update assignment dates to fixed values
  @assign_ben.update_attribute(:start_date, Date.new(2018,2,14))
  @assign_ben.update_attribute(:end_date, Date.new(2019,8,17))
  @promote_ben.update_attribute(:start_date, Date.new(2019,8,17))
  @promote_ben.update_attribute(:end_date, nil)
  @assign_ed.update_attribute(:start_date, Date.new(2019,3,14))
  @assign_ralph.update_attribute(:start_date, Date.new(2019,5,21))
  @assign_cindy.update_attribute(:start_date, Date.new(2018,11,17))
  @assign_kathryn.update_attribute(:start_date, Date.new(2019,4,30))
  # fix Ben Sisko's birthday
  @ben.date_of_birth = Date.parse("2001-02-15")
  @ben.save

end

Given /^no setup yet$/ do
  # assumes initial setup already run as background
  destroy_assignments
  destroy_stores
  destroy_employees
end
