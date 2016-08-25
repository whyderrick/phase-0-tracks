def new_employee_intake
  puts "What is your name?"
  name = gets.chomp
  puts "How old are you?"
  age = gets.chomp.to_i
  puts "What year were you born?"
  birth_year = gets.chomp.to_i
  puts "Should we order you garlic bread?"
  garlic_bread = gets.chomp
  puts "Would you like to enroll in the company health plan?"
  health_care= gets.chomp
end