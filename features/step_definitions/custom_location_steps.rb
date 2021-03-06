Given /^I have a custom location$/ do
  # hooks.rb setups a custom location, so we don't have to do anything here
  no_op
end

When /^I add a task with a custom location$/ do
  add_task location: custom_location
end

Then "my task should be stored in the default location" do
  task_present
end

Then /^my task should be stored in the custom location$/ do
  task_present(location: custom_location)
end

