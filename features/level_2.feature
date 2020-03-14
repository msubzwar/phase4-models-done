Feature: Manage employees
  As an administrator
  I want to be able to manage employee information
  So employees can have an employment history with the creamery

  Background:
    Given an initial setup
  
  # READ METHODS
  Scenario: No active employees yet
    Given no setup yet
    When I go to the employees page
    Then I should see "There are no active managers at this time"
    And I should see "There are no active employees at this time"
    And I should not see "Name"
    And I should not see "Current Assignment"
    And I should not see "Phone"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View all employees
    When I go to the employees page
    Then I should see "Active Managers"
    And I should see "Active Employees"
    And I should see "Name"
    And I should see "Phone"
    And I should see "Current Assignment"
    # And I should see "Options"
    And I should see "Janeway, Kathryn"
    And I should see "Sisko, Ben"
    And I should see "Crawford, Cindy"
    And I should see "Gruberman, Ed"
    And I should see "412-268-2323"
    And I should see "CMU"
    And I should see "Oakland"
    And I should see "n/a"
    And I should see "Inactive Employees"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View employee details with history
    When I go to Ben Sisko details page
    Then I should see "Ben Sisko"
    And I should see "Manager"
    And I should see "Phone"
    And I should see "412-268-2323"
    And I should see "Social Security Number"
    And I should see "091-36-1492"
    And I should see "Date of Birth"
    And I should see "Feb 15, 2001"
    And I should see "Active with AMC"
    And I should see "Current Assignment"
    And I should see "CMU"
    And I should see "since Aug 17, 2019"
    And I should see "Previous Assignments"
    And I should see "Dates"
    And I should see "2/14/18 - 8/17/19"
    And I should not see "n/a"
    And I should not see "false"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
  

    Scenario: View employee details with no history
    When I go to Cindy Crawford details page
    Then I should see "Cindy Crawford"
    And I should see "Employee"
    And I should not see "n/a"
    And I should not see "Previous Assignments"
    And I should not see "Dates"
    And I should not see "true"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View employee details with no current assignment
    When I go to Ed Gruberman details page
    Then I should see "Ed Gruberman"
    And I should see "Current Assignment"
    And I should see "n/a"
    And I should see "Previous Assignments"
    And I should see "Dates"
    And I should not see "true"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: The employee name is a link to details
    When I go to the employees page
    And I click on the link "Sisko, Ben"
    Then I should see "Ben Sisko"
    And I should see "Manager"
    And I should see "Phone"
    And I should see "412-268-2323"
    And I should see "Social Security Number"
    And I should see "091-36-1492"

  Scenario: The store in #show is a link to store details
    When I go to Ben Sisko details page
    And I click on the link "CMU"
    Then I should see "CMU Store"
    And I should see "5000 Forbes Avenue"
    And I should see "Manager(s)"
    And I should see "Current Employees"
    And I should see "Crawford, Cindy"
    And I should see "Sisko, Ben"

  
