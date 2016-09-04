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
  name_arr.each { |e| $new_name_arr << e}
  $new_name_arr[0] = name_arr[-1]
  $new_name_arr[-1] = name_arr[0]
  $new_name_arr
end



def shift_letters
  letters_arr = []
  letters_arr = $new_name_arr.map do |word|
    word.split('')
  end
  for letters_arr.first && letters_arr.last

  end
  p
end

