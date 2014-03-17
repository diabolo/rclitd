module LocationSH
  def default_location
    Todo.location
  end

  def custom_location
    "#{default_location}.custom"
  end

end
World LocationSH


