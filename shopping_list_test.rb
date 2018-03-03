require 'colorize'
require_relative 'shopping_list'
require_relative 'find_food'

def expect actual, message, expected
    if actual == expected then
        puts "  PASS #{message}".colorize(:green)
    else
        puts "  FAIL #{message} expected #{expected}, but got #{actual}".colorize(:red)
    end
end

def subject subject_name
  puts subject_name
end

def test_for_shortage
    subject "shopping list"
    pantry = {"eggs"=>3.0, "bread"=>1.0}
    shopping_list = {}
    item = "eggs"
    amount = 4
    actual = ShoppingList.edit_shopping_list(pantry, shopping_list, item, amount)
    expected = {"eggs"=>1.0}

    expect(actual, " - if the ingredient is in the pantry but user's recipe needs more than in the pantry than the shortage should be added to the shopping list", expected)
end

def test_when_available
    subject "shopping list"
    pantry = {"eggs"=>3.0, "bread"=>1.0}
    shopping_list = {}
    item = "eggs"
    amount = 3
    actual = ShoppingList.edit_shopping_list(pantry, shopping_list, item, amount)
    expected = {}

    expect(actual, " - If we've got the full amount on hand the shopping list shouldn't be added with any ingredients needed", expected)
end

def test_when_new
    subject "shopping list"
    pantry = {"eggs"=>3.0, "bread"=>1.0}
    shopping_list = {}
    item = "avo"
    amount = 2
    actual = ShoppingList.edit_shopping_list(pantry, shopping_list, item, amount)
    expected = {"avo"=>2.0}

    expect(actual, " - if the ingredient is not in the pantry the full amount should be added to the shopping list", expected)
end

puts test_for_shortage
puts test_when_available
puts test_when_new
