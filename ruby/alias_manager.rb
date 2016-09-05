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


$name = "Felicia del Torres"
$new_name_arr = []

def swap_names
  name_arr = $name.split(' ')
  name_arr.each { |e| $new_name_arr << e.downcase}
  $new_name_arr[0] = name_arr[-1]
  $new_name_arr[-1] = name_arr[0]
  $new_name_arr
end

def shift_letters(array)
  alphabet = ("a".."z").to_a
  vowels = alphabet.select { |char| char =~ /[aeiou]/ }
  consonants = alphabet.select {|char| char =~ /[^aeiou]/}
  letters_arr = array.map do |letter|
    if vowels.include? letter
      vowels[vowels.index(letter) + 1]
    elsif consonants.include? letter
      consonants[consonants.index(letter) + 1]
    else
      puts "This isn't a letter"
    end
  end
  letters_arr
end

# This is the method that will provide the user interface.
def cipher
end

