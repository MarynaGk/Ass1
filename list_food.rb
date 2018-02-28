module List_food

LIST_COMAND = 'list'

module_function

  def list_all pantry
    if pantry.empty?
      puts "Your pantry is empty"
    else
      puts "Here is what's in your pantry:"
      pantry.each {|key, value| puts "#{key} : #{value}" }
    end
  end

end
