require_relative 'find_food'

module Shopping_list

SHOPPING_COMAND = 'shopping'

module_function

  def list_for_recipe pantry
    shopping_list = {}
    puts "Please enter required ingridients. Enter 'done' when finished"
    while true
      puts "Item:"
      item = gets.strip.downcase
      if item == "done"
        break
      end
      puts "Amount:"
      amount = gets.strip
      if amount == "done"
        break
      end
      shortage = (amount.to_f-Find_food.get_stock(pantry,item))
      if shortage > 0
        shopping_list.store(item, shortage)
      end
    end
    puts "Here is your shopping list:\n"
    shopping_list.each {|key, value| puts "#{key} : #{value}" }
  end

end
