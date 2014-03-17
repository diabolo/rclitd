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

  def task_present(attrs={})
    loc = attrs[:location] || default_location
    count = attrs[:count] || 1

    File.exist?(loc).should be_true
    File.open(loc) do |f|
      f.each_line.count.should == count
    end
  end

  def should_see_some_tasks
    @output.each_line.count.should == some
  end
end
World TaskSH

