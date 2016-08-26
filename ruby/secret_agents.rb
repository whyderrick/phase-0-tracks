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
puts "Input string: "
str = gets.chomp

while (str  str.length)








=begin
Decryption

1. Grab string
2. Take each letter of string
 1. For each letter, change it to the letter before it in the alphabet
 2. If it's a space character, leave it as is
3. Move to next letter until the end of the string
4. Save new string

=end