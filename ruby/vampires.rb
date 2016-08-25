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
  # Ask name
  puts "What is your name?"
  name = gets.chomp
  # Ask age
  puts "How old are you?"
  age = gets.chomp.to_i
  # Ask birthyear
  puts "What year were you born?"
  birth_year = gets.chomp.to_i
  # Check that age and birthyear make sense together
  if age == (2016 - birth_year)
    # I'd love to use the Ruby Date Object here, but couldn't work it out quickly enough
    true_age = true
  else
    true_age = false
  end
  # Check if they'll eat garlic
  puts "Should we order you garlic bread?"
  garlic_bread = string_to_bool(gets.chomp)
  puts "Would you like to enroll in the company health plan?"
  health_care= string_to_bool(gets.chomp)

  if t && garlic_bread
    "Probably not a vampire"
  elsif !(age == (2016 - birth_year)) && (garlic_bread || garlic_bread)
    "Probably a vampire"
  end
end