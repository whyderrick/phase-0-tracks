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
  # Ask how big the batch is
  puts "How many employees are you onboarding?"
  num_employees = gets.chomp.to_i
  num_employees.times do |candidate|
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
    allergies = []
    puts "Enter any allergies you have. (Type \"done\" when you're finished)."
    input = gets.chomp.downcase
    until input == "done"
      allergies << input
      input = gets.chomp.downcase
    end
    # puts allergies

    is_vampire = "results inconclusive."
    if true_age && garlic_bread
      is_vampire ="probably not a vampire."
    end
    if !true_age && (!(garlic_bread || health_care))
      is_vampire = "probably a vampire."
    end
    allergies.each do |word|
      is_vampire = "probably a vampire" if word == "sunshine"
    end
    if !true_age && !garlic_bread && !health_care
      is_vampire = "almost certainly a vampire."
    end
    if name == "Drake Cula" || name == "Tu Fang"
      is_vampire = "definitely a vampire."
    end
    puts "#{name} is #{is_vampire}."
  end
  puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
end

new_employee_intake