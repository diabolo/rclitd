Feature: Task list location
  As a user
  I want todo to store my tasks in a sensible default location
  Unless I tell it specifically to store them somewhere else

  Notes:

  There are many sensible defaults for storing the task list, we do not want to
  specify which one we are choosing here, because:

  1. This is likely to change
  2. The application should define this location
  3. We will probably add a config file which will be able to ovveride this
  setting


  Scenario: Add a task
    When I add a task
    Then my task should be stored in the default location

  Scenario: Add a task specifying a custom location
    Given I have a custom location
    When I add a task with a custom location
    Then my task should be stored in the custom location
