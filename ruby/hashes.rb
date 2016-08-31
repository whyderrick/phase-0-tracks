=begin
Pseudocode for interior design
1. Prompt for customer name
2. Create new hash
3. Prompt user for the following types of input
  - client age
  - client income
  - client's inspirations (stored as array)
  - repeat client?
  - budget
4. Store user answers in a hash for that customer.
5. Print the data to the screen
6. Ask user to find mistakes
  - If there's one,
  --  ask for the field that has an error
  --  convert that user string to a symbol
  --  update the has at the key for that symbol
  - Otherwise ask user to enter "done" and exit
7. Print the updated version
8. Exit

=end

#prompting user for info
  puts "What's your client's name?"
  client_name = gets.chomp
  puts "How old is your client?"
  client_age = gets.chomp.to_i
  puts "What's your client's income?"
  client_income = gets.chomp.to_i
  puts "What's your clients budget in thousands?"
  client_budget = gets.chomp.to_i
  puts "Have you worked with this client before? (True/False)"
  client_repeat = gets.chomp
  if client_repeat.downcase == "true"
    client_repeat = true
  else
    client_repeat = false
  end
  puts "List the design references your client has given you (Type \"Done\" when you've finished)."
  client_inspiration = []
  design_input = gets.chomp
  until design_input.downcase == "done"
    client_inspiration << design_input
    puts "Anything else? (Type \"Done\" if not.)"
    design_input = gets.chomp
  end

h_name = client_name.downcase.gsub(/\s/, '_') # This step of evaluating a variable and setting its value to the name of the hash is trickier than I'd anticipated. Might require a Class. Shelving it for now.

client = {
  name: client_name,
  age: client_age,
  income: client_income,
  budget: client_budget,
  repeat: client_repeat,
  inspration: client_inspiration,
}

p client

puts "Any mistakes? Enter \"Yes\" or \"No\"."
mistakes = get.chomp.downcase
if mistakes.downcase == "yes"
  puts "Whoops! Which field do you want to change?"
  mistaken_field = gets.chomp.to_sym
  puts "What should we change it to?"
  client[mistaken_field] = gets.chomp
  puts "Here's what we have now: "
  p client
  puts "Take care!"
else
  puts "Glad we got it right. Thanks!"
end