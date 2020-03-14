Feature: Manage stores
  As an administrator
  I want to be able to manage store information
  So I can connect employee activity to particular stores

  Background:
    Given an initial setup
  
  # READ METHODS
  Scenario: No active stores yet
    Given no setup yet
    When I go to the stores page
    Then I should see "There are no active stores at this time."
    And I should not see "Name"
    And I should not see "Current Assignments"
    And I should not see "Phone"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View all stores
    When I go to the stores page
    Then I should see "Active Stores"
    And I should see "Name"
    And I should see "Current Assignments"
    And I should see "Phone"
    And I should see "CMU"
    And I should see "Oakland"
    And I should see "2"
    # And I should see "Options"
    And I should see "412-268-8211"
    And I should see "Inactive Stores"
    And I should not see "true"
    And I should not see "True"
    And I should not see "false"
    And I should not see "False"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"
  
  Scenario: The store name is a link to store details
    When I go to the stores page
    And I click on the link "Oakland"
    Then I should see "Phone"
    And I should see "412-268-8211"
    And I should see "Manager(s)"
    And I should see "Kathryn Janeway"
    And I should see "Current Employees"
    And I should see "Janeway, Kathryn"
    And I should see "Wilson, Ralph"
    And I should see "Active"
    And I should see "Address"
    And I should see "5000 Forbes Avenue"
    And I should see "Pittsburgh, PA 15213"
    And I should not see "true"
    And I should not see "True"
    And I should not see "false"
    And I should not see "False"
    And I should not see "City"
    And I should not see "State"
    And I should not see "Zip"
        
  Scenario: Inactive store details in order
    When I go to the stores page
    And I click on the link "Hazelwood"
    Then I should see "Phone"
    And I should see "Manager(s)"
    And I should see "n/a"
    And I should see "Current Employees"
    And I should see "There are no employees assigned at this time."
    And I should see "Active"
    And I should see "No"
    And I should not see "true"
    And I should not see "True"
    And I should not see "false"
    And I should not see "False"

