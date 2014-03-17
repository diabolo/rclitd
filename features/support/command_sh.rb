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
