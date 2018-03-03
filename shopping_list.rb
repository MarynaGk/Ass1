require_relative 'find_food'

module ShoppingList

SHOPPING_COMAND = 'shopping'

module_function

def edit_shopping_list pantry, shopping_list, item, amount
  shortage = (amount.to_f-FindFood.get_stock(pantry,item))
  if shortage > 0
    shopping_list.store(item, shortage)
  end
  return shopping_list
end

  def list_for_recipe pantry
    shopping_list = {}
    puts "Please enter required ingedients (one ingredient at a time). Enter 'DONE' when finished".colorize(:color => :light_green, :background => :light_black)
    while true
      puts "Recipe Ingredient:".colorize(:color => :light_green, :background => :light_black)
      item = gets.strip.downcase
      if item == "done"
        break
      end
      puts "Amount:".colorize(:color => :light_green, :background => :light_black)
      amount = gets.strip
      if amount == "done"
        break
      end
      edit_shopping_list(pantry, shopping_list, item, amount)
    end
    puts "Here is your shopping list:\n"
    shopping_list.each {|key, value| puts "#{key} : #{value}".colorize(:light_yellow) }
  end

end
