module TaskSH
  def add_task
    `todo new 'New todo item'`
  end

  def task_count
    `todo list | wc -l`.chomp.to_i
  end
end
World TaskSH

When /^I add a task$/ do
  add_task
end

When /^I add (\d+) tasks$/ do |n|
  n.to_i.times { add_task }
end

Then /^there should be (\d+) tasks$/ do |n|
  task_count.should == n.to_i
end

Then /^there should be a task$/ do
  task_count.should > 0
end

