=begin Pseudocode Release 0
Take user input for real name
Split input into separate words
Create a new name
  - Change the word in position[0] to be whichever word is in position [-1]
  - Change vowels to next vowel
  - Change consonants to next consonant
Return new name

Time limit: 40mins – lololols

=end




def swap_names(name)
  new_name_arr = []
  name_arr = name.split(' ')
  name_arr.each { |e| new_name_arr << e.downcase}
  new_name_arr[0] = name_arr[-1]
  new_name_arr[-1] = name_arr[0]
  new_name_arr
end

def shift_letters(array)
  alphabet = ("a".."z").to_a
  vowels = alphabet.select { |char| char =~ /[aeiou]/ }
  vowels << "a"
  consonants = alphabet.select {|char| char =~ /[^aeiou]/}
  consonants << "b"
  # Padding the array with the first value again in case we have end of input. There are better ways that I'll research when I've finished.
  # names_array = name.downcase.split(' ')
  swapped_array = array.map do |word|
    word.chars.map do |letter|
      if vowels.include? letter
        vowels[vowels.index(letter) + 1]
      elsif consonants.include? letter
        consonants[consonants.index(letter) + 1]
      else
        letter
      end
    end
  end
  new_name = swapped_array.map{|item| item.join.capitalize}
  new_name = new_name.join(' ')
  new_name
end

# This is the method that will provide the user interface.
def cipher_name
  puts "Would you like to scramble a name? \n
  (Type \"Quit\" when you've finished.)"
  input = gets.chomp.downcase
  legend = {}
  until input == "quit"
    puts "What name would you like to scramble?"
    name = gets.chomp
    array = swap_names(name.downcase)
    codename = shift_letters(array)
    puts "Your codename is #{codename}"
    legend[name] = codename
    puts "Would you like to do another? \n
    (\"Quit\" for no)."
    input = gets.chomp.downcase
  end
  legend.each{|k,v| puts "#{k} uses the name \"#{v}\" while in the field."}
end

cipher_name
