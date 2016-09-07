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
  array_of_items.each { |item| hash[item] = item_quantity }
  hash
end

def add_item(string, hash)
  hash[string] = 1
end

def remove_item(string, hash)
  hash.delete(string)
  hash
end

def update_quantity(item, new_quantity, hash)
  hash[item] = new_quantity
end

def print_list(hash)
  hash.each { |k,v| puts "Pick up #{v} #{k}." }
end

# DRIVER CODE

create_grocery_list("Lemonade Tomatoes Onions", hash_of_items)
add_item("Ice Cream", hash_of_items)
update_quantity("Lemonade", 2, hash_of_items)
update_quantity("Tomatoes", 3, hash_of_items)
update_quantity("Ice Cream", 4, hash_of_items)
remove_item("Lemonade", hash_of_items)
print_list(hash_of_items)

# With an additional 20 minutes we could refactor the create list method to allow the string to take quantities as well by splitting into two arrays for item and quantity based on whether the item's index is even or odd