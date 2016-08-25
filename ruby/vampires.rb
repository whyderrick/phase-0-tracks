def new_employee_intake
  def string_to_bool(string)
    if string.downcase == "true"
      true
    elsif string.downcase == "false"
      false
    else
      puts "Please enter \"True\" or \"False\"."
      string = string_to_bool(gets.chomp)
    end
  end

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

  if age == (2016 - birth_year) && garlic_bread
    "Probably not a vampire"
  elsif !(age == (2016 - birth_year)) && (garlic_bread || garlic_bread)
    "Probably a vampire"
  end
end