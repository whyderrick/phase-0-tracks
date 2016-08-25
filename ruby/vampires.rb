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

  is_vampire = "Results inconclusive."
  if true_age && garlic_bread
    is_vampire ="Probably not a vampire."
  end
  if !true_age && (!(garlic_bread || health_care))
    is_vampire = "Probably a vampire."
  end
  if !(true_age && garlic_bread && health_care)
    is_vampire = "Almost certainly a vampire."
  end
  if name = "Drake Cula" || name = "Tu Fang"
    is_vampire = "Definitely a is_vampire."
  end
  print is_vampire
end