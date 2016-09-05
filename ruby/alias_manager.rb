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


#$name = "Felicia del Torres"
#$new_name_arr = []

def swap_names(name)
  name_arr = name.split(' ')
  name_arr.each { |e| @new_name_arr << e.downcase}
  @new_name_arr[0] = name_arr[-1]
  @new_name_arr[-1] = name_arr[0]
  @new_name_arr
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
      p letter
      if vowels.include? letter
        vowels[vowels.index(letter) + 1]
      elsif consonants.include? letter
        consonants[consonants.index(letter) + 1]
      else
        puts "This isn't a letter"
      end
    end
  end
  swapped_array
end

# This is the method that will provide the user interface.
def cipher_name
  puts "Would you like to scramble a name? \n
  (Type \"Quit\" when you've finished.)"
  input = gets.chomp.downcase
  while input != "quit"
    puts "What name would you like to scramble?"
    name = gets.chomp.downcase
    @new_name_arr = []
    array = swap_names(name)
    array = array.map!{|word| word.chars}
    p array
    shift_letters(array)
    puts "Would you like to do another? \n
    (\"Quit\" for no)."
    input = gets.chomp.downcase
  end
end

cipher_name
