require_relative 'add_food'
require_relative 'take_food_out'
require_relative 'list_food'
require_relative 'find_food'
require_relative 'shopping_list'
require 'highline'
require 'colorize'

module Pantryapp
  module_function

def done
  exit
end

pantry={}

puts "PANTRY APP MENU".colorize(:color => :black, :background => :light_green)

gem = HighLine.new
loop do
gem.choose do |menu|

    menu.choice("Add food to your pantry".colorize(:light_green)) { (AddFood::add_item(pantry) ) }
    menu.choice("Take food from your pantry".colorize(:light_green)) { ( TakeFoodOut::remove_item(pantry) ) }
    menu.choice("List the food you have in your pantry".colorize(:light_green)) { ( ListFood::list_all(pantry) ) }
    menu.choice("Find food in the pantry".colorize(:light_green)) { ( FindFood::show_stock(pantry)  ) }
    menu.choice("Make a grocery list".colorize(:light_green)) { ( ShoppingList::list_for_recipe(pantry) ) }
    menu.choice("Exit".colorize(:light_green)) { (done) }
    menu.prompt = "What would you like to do in the pantry? (OPTION: 1, 2, 3, 4, 5, 6)".colorize(:color => :light_green, :background => :light_black)
    puts "\n"
  end
end

end
