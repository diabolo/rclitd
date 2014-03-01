module Cuke
  module Path
    def self.add_bin
      ENV['PATH'] = "#{bin_location}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
    end

    def self.bin_location
      "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}"
    end
  end
  module RubyLib
    def self.add_lib
      ENV['RUBYLIB'] = "#{lib_dir}#{File::PATH_SEPARATOR}#{ENV['RUBYLIB']}"
    end

    def self.lib_dir
      File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')
    end
  end

  def self.relocate_home
    ENV['HOME']=FAKEHOME
  end
  FAKEHOME='/tmp/fakehome'
end

Cuke::Path.add_bin
Cuke::RubyLib.add_lib
Cuke.relocate_home

Before do
  raise RuntimeError.new("About to write in #{Todo.location}") unless Todo.location == "#{Cuke::FAKEHOME}/.todo.txt"
  FileUtils.rm_rf Cuke::FAKEHOME
  FileUtils.mkdir_p Cuke::FAKEHOME
end
