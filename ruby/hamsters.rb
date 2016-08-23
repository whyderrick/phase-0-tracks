def intake_hamster
  puts "What your hamster's name?"
  ham_name = gets.chomp
  puts "Does your hamster turn up? (Answer 1-10)"
  turn_up = gets.chomp.to_i
  puts "What color is your hamster?"
  ham_color = gets.chomp
  puts "Is your hamster a good candidate for adoption? (true, false)"
  adoption = gets.chomp.downcase
  # How do we make our input accept "TRUE", "true" and "True"
  adoption = true if adoption == "true"
  adoption = false if adoption == "false"
  puts "How old would you guess your hamster is?"
  estimated_age = gets.chomp
  if estimated_age == ""
    estimated_age = nil
  end
  if adoption == true
    puts "Your hamster is name #{ham_name}. Its turn-up ratio is #{turn_up}. Its color is #{ham_color}. Its age is #{estimated_age}."
  else
    puts "Your hamster's no good for adoption. It's this old: #{estimated_age}."
  end
end

intake_hamster
