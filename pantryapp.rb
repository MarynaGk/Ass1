require_relative 'add_food'
require_relative 'take_food_out'
require_relative 'find_food'
require_relative 'list_food'
require_relative 'shopping_list'

EXIT = 'exit'

module Pantryapp
  module_function

  def welcome
    puts "Welcome to the pantry app"
  end

  def prompt
    puts "What would you like to do? Please put one of the following keywords:\n\n"
    puts "> add - add items to the pantry"
    puts "> take - take items out of the pantry"
    puts "> list - print the list of the items in the pantry"
    puts "> search - look if the certain item is in the pantry"
    puts "> shopping - create a shopping list for the items in the recipe we need to buy"
    puts "> exit\n\n"
    gets.strip.downcase
  end

  def start
    comand = welcome
    pantry = {}
    while comand != EXIT
      comand = prompt
      puts comand
      case comand
      when Add_food::ADD_COMAND
        Add_food.add_item pantry
      when Take_food_out::TAKEOUT_COMAND
        Take_food_out.remove_item pantry
      when List_food::LIST_COMAND
        List_food.list_all pantry
      when Find_food::SEARCH_COMAND
        Find_food.show_stock pantry
      when Shopping_list::SHOPPING_COMAND
        Shopping_list.list_for_recipe pantry
      else
        puts "Wrong input"
      end

    end
  end

end

puts Pantryapp.start
