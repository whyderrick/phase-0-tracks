// Reverse a string in steps

// Accept a string as input; store it as a variable
// Create an empty string to hold the reversed word
// Starting at the end of the input word, loop through through the word, to the beginning
// - add each letter of the word to the new string.

function reverseString(string) {
  newString = ""
  for (i = string.length -1; i >= 0 ; i--) {
    newString += string[i]
  }
  return newString
}

console.log(reverseString("Derrick"))