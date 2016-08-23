def intake_hamster
  puts "What your hamster's name?"
  ham_name = gets.chomp
  puts "Does your hamster turn up? (Answer 1-10)"
  turn_up = get.chomp.to_i
  puts "What color is your hamster?"
  ham_color = gets.chomp
  puts "Is your hamster a good candidate for adoption? (True, False)"
  adoption = gets.chomp
  adoption = true if adoption == "True"
  adoption = false if adoption == "False"
  puts "How old would you guess your hamster is?"
  estimated_age = gets.chomp.to_i
  estimated_age = nil if estimated_age == ""
end
