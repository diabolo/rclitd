Feature: List tasks
  As a user
  I want to be able to see the tasks I have created
  So I can see what I need to do

  Scenario: View a list of tasks
    Given I have added some tasks
    When I list the tasks
    Then I should see some tasks
