Feature: New task
  As a user
  I want to store new tasks
  So I can record what I want to do

  Scenario: Store a task
    When I add a task
    Then there should be a task

  Scenario: Store a number of tasks
    When I add 5 tasks
    Then there should be 5 tasks
