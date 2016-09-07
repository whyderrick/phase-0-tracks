# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # take the name of an item we are adding to our list
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: each key in the hash



# Method to add an item to a list
# input: item name and optional quantity
# steps: prompt them for the input and quantity
# steps: save that as a variable and add to the hash
# output: updated hash with new item and quantity

# Method to remove an item from the list
# input: name of an existing item in the list
# steps: look up item in hash based on key
# steps: delete it
# output: updated hash without the removed item

# Method to update the quantity of an item
# input: item and new quantity
# steps: look up the item in the hash based on the key
# steps: update its quantity
# output: updated hash with a new quantity for an item

# Method to print a list and make it look pretty
# input: hash
# steps: iterate through the hash and print each key value pair in a specified format
# output: stylized version of the hash


hash_of_items = {}

def create_grocery_list(string, hash)
  array_of_items = string.split(" ")
  item_quantity = 1
  array_of_items.each do |item|
    hash[item] = item_quantity
  end
  p hash
end


def add_item(string, hash)
  hash[string] = 1
end

def print_list

end
# DRIVER CODE

create_grocery_list("apple banana carrot", hash_of_items)
add_item("durian", hash_of_items)