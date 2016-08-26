=begin
encryption

1. Take input string
2. While we have letters left
  a. Take the next available letter
    1. If that character is "_" do nothing
    2. Otherwise change to next letter in the alphabet
    3. Add it to a new string
    4. Return to 2.1

=end
def encryption(str)
  # puts "Input string: "
  # str = gets.chomp.downcase
  encypted_str = ""
  count = 0

  while count < str.length
    if str[count] == " "
      count += 1
    elsif str[count] == "z"
      encypted_str += "a"
    else
      encypted_str += str[count].next
      count += 1
    end
  end
  encypted_str
end

=begin
decryption

1. Grab string
2. Take each letter of string
 1. For each letter, change it to the letter before it in the alphabet
 2. If it's a space character, leave it as is
3. Move to next letter until the end of the string
4. Save new string
=end

def decryption(str)
  # puts "Input string:"
  # str = gets.chomp.downcase
  decrypted_str = ""
  cipher = "abcdefghijklmnopqrstuvwxyz"
  count = 0

  while count < str.length
    if str[count] == " "
      count += 1
    else
      c_index = cipher.index(str[count])
      new_letter = cipher[c_index - 1]
      decrypted_str += new_letter

      count += 1
    end
  end
  decrypted_str
end


decryption(encryption("Swordfish"))
# This is a nested method call. It works because of the order in which method calls are evaluated. Anything in parentheses is evaluated before it's passed to functions. In the same way that placing a variable or mathematical expression in the method argument would cause the method to be evaluated against the value of the variable or the expression, what we've done here is decrypted "Swordfish" after it's been passed through encryption