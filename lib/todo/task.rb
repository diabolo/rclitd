module Todo
  class Task
    FILENAME='~/.todo.txt'

    def self.new_tasks(filename, tasks)
      File.open(filename, 'a+') do |f|
        tasks.each do |task|
          f.puts [task, Time.now].join(',')
        end
      end

    end

    def initialize(task_name)
    end
  end
end
