=begin Pseudocode Release 0
Take user input for real name
Split input into separate words
Create a new name
  - Change the word in position[0] to be whichever word is in position [-1]
  - Change vowels to next vowel
  - Change consonants to next consonant
Return new name

Time limit: 40mins

=end


def swap_names
  name = "Felicia del Torres" #expected output "Vussit Gimodoe"
  name_arr = name.split(' ')
  p name_arr
  new_name_arr = []
  p new_name_arr
  new_name_arr.unshift(name_arr[-1])
  p new_name_arr
  p name_arr
  new_name_arr.push(name_arr[0])
  p new_name_arr
  p name_arr
end

def swap2
  name = "Felicia del Torres"
  name_arr = name.split(' ')
  new_name_arr = []
  name_arr.each { |e| new_name_arr << e}
  new_name_arr[0] = name_arr[-1]
  new_name_arr[-1] = name_arr[0]
  p new_name_arr
  p name_arr
end
