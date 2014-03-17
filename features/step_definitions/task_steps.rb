
Given /^I have added some tasks$/ do
  some.times { add_task }
end

When /^I add a task$/ do
  add_task
end

When /^I add (\d+) tasks$/ do |n|
  n.to_i.times { add_task }
end

When /^I list the tasks$/ do
  list_tasks
end

Then /^there should be a task$/ do
  task_count.should > 0
end

Then /^there should be (\d+) tasks$/ do |n|
  task_count.should == n.to_i
end

Then /^I should see some tasks$/ do
  should_see_some_tasks
end

