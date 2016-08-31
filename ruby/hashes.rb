=begin
Pseudocode for interior design
1. Prompt for customer name
2. Create new hash
3. Prompt user for the following types of input
  - client age
  - client income
  - client's inspirations (stored as array)
  - repeat client?
  - house type
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

def get_info  #prompting user for info
  puts "What's your client's name?"
  client_name = gets.chomp
  puts "How old is your client?"
  client_age = gets.chomp.to_i
  puts "What's your client's income?"
  client_income = gets.chomp.to_i
  puts "Have you worked with this client before? (True/False)"
  client_repeat = gets.chomp
  puts "List the design references your client has given you (Type \"Done\" when you've finished)."
  client_inspiration = []
  design_input = gets.chomp
  until design_input.downcase = "done"
    client_inspiration << design_input
    puts "Anything else? (Type \"Done\" if not.)"
    design_input
  end



end