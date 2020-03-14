Feature: Manage assignments
  As an administrator
  I want to be able manage assignments
  So employees are correctly connected to stores

  Background:
    Given an initial setup
  
  # READ METHODS
  Scenario: No assignments yet
    Given no setup yet
    When I go to the assignments page
    Then I should see "There are no current assignments at this time"
    And I should see "There are no past assignments at this time"
    And I should not see "Employee Name"
    And I should not see "Store Name"
    And I should not see "Dates"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View all assignments
    When I go to the assignments page
    Then I should see "Current Assignments"
    And I should see "Past Assignments"
    And I should see "Employee Name"
    And I should see "Sisko, Ben"
    And I should see "Store Name"
    And I should see "CMU"
    And I should see "Dates"
    And I should see "8/17/19 - Present"
    And I should see "2/14/18 - 8/17/19"
    And I should not see "Hazelwood"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
  
  Scenario: The employee name is a link to employee details
    When I go to the assignments page
    And I click on the link "Sisko, Ben"
    Then I should see "Ben Sisko"
    And I should see "Manager"
    And I should see "Phone"
    And I should see "412-268-2323"
    And I should see "Social Security Number"
    And I should see "091-36-1492"

  Scenario: The store name is a link to store details
    When I go to the assignments page
    And I click on the link "Oakland"
    Then I should see "Phone"
    And I should see "412-268-8211"
    And I should see "Manager(s)"
    And I should see "Kathryn Janeway"
    And I should see "Current Employees"
    And I should see "Janeway, Kathryn"
    And I should see "Wilson, Ralph"