module ListFood

LIST_COMAND = 'list'

module_function

  def list_all pantry
    if pantry.empty?
      puts "Your pantry is empty".colorize(:red)
    else
      puts "Here is what's in your pantry:".colorize(:color => :light_green, :background => :light_black)
      pantry.each {|key, value| puts "#{key} : #{value}".colorize(:light_yellow) }
    end
  end

end
