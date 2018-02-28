require_relative 'find_food'

module Add_food

ADD_COMAND = 'add'

module_function

  def add_item pantry
    puts "Please enter the food name"
    item = gets.strip
    puts "Please enter amount to add"
    amount = gets.strip.to_f
    if Find_food.is_in_pantry pantry,item
      pantry[item] += amount
    else
      pantry.store(item, amount)
    end
    pantry.each {|key, value| puts "#{key} : #{value}" }
  end

end
