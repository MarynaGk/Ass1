require_relative 'find_food'
require_relative 'list_food'
require 'colorize'

module AddFood

ADD_COMAND = 'add'

module_function

  def add_item pantry
    puts "Please enter the food name".colorize(:color => :light_green, :background => :light_black)
    item = gets.strip.downcase
    puts "Please enter amount to add".colorize(:color => :light_green, :background => :light_black)
    amount = gets.strip.to_f
    if FindFood.is_in_pantry pantry,item
      pantry[item] += amount
    else
      pantry.store(item, amount)
    end
  ListFood.list_all(pantry)
  end

end
