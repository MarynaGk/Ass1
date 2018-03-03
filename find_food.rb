module FindFood

SEARCH_COMAND = 'search'

module_function

  def is_in_pantry pantry, item
    pantry.has_key?(item)
  end

  def get_stock pantry, item
    if is_in_pantry pantry,item
      pantry[item]
    else
      0
    end
  end

  def show_stock pantry
    puts "What item are you after?".colorize(:color => :light_green, :background => :light_black)
    item = gets.strip.downcase
    if (amount = FindFood.get_stock(pantry, item)) > 0
      puts "The amount you've got: #{amount}".colorize(:light_yellow)
    else
      puts "You haven't got any".colorize(:red)
    end
  end

end
