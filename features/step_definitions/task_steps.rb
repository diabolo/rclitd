module TaskSH
  def add_task
    `todo new 'New todo item'`
  end

  def task_count
    `todo list | wc -l`.chomp.to_i
  end

  def default_location
    "#{Todo::DEFAULT_LOCATION}/#{Todo::DEFAULT_FILENAME}"
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

Then "my task should be stored in the default location" do
  File.exist?(default_location).should be_true
  File.open(default_location) do |f|
    f.lines.count.should == 1
  end
end
