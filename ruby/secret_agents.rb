=begin
Encryption

1. Take input string
2. While we have letters left
  a. Take the next available letter
    1. If that character is "_" do nothing
    2. Otherwise change to next letter in the alphabet
    3. Add it to a new string
    4. Return to 2.1

=end
def encryption
  puts "Input string: "
  str = gets.chomp.downcase
  encypted_str = ""
  count = 0

  while count < str.length
    encypted_str += str[count].next
    count += 1
  end
  encypted_str
end

=begin
Decryption

1. Grab string
2. Take each letter of string
 1. For each letter, change it to the letter before it in the alphabet
 2. If it's a space character, leave it as is
3. Move to next letter until the end of the string
4. Save new string
=end

def decryption
  puts "Input string:"
  str = gets.chomp.downcase
  decrypted_str = ""
  cipher = "abcdefghijklmnopqrstuvwxyz"
  count = 0

  while count < str.length
    new_letter =
  end
end
