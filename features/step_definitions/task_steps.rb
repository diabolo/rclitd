module TaskSH
  def add_task(attrs={})
    command = "#{xec(attrs)} new 'New todo item'"
    runc command
  end

  def list_tasks(attrs={})
    command = "#{xec(attrs)} list"
    runc command
  end

  def task_count
    `todo list | wc -l`.chomp.to_i
  end

  def default_location
    Todo.location
  end

  def task_present(attrs={})
    loc = attrs[:location] || default_location
    count = attrs[:count] || 1

    File.exist?(loc).should be_true
    File.open(loc) do |f|
      f.each_line.count.should == count
    end
  end

  def some; 3; end

  def should_see_some_tasks
    @output.each_line.count.should == some
  end
end
World TaskSH

module CommandSH
  def runc(command)
    @output = `#{command}`
  end

  def xec(attrs)
    "#{executable}#{global_options(attrs)}"
  end

  def executable
    # must end with a space
    "todo "
  end

  def global_options(attrs)
    # must end with a space
    "-f #{attrs[:location]} " if attrs[:location]
  end
end
World CommandSH

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
  task_present
end

Given /^I have added some tasks$/ do
  some.times { add_task }
end

When /^I list the tasks$/ do
  list_tasks
end

Then /^I should see some tasks$/ do
  should_see_some_tasks
end

