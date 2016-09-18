// Functions

/*
Pseudocode return longest word or phrase in an array (findLongest)
Input: An array of words and phrase
Output: A single item from the array, that which has the greatest length
How do we get there?:
- Take the array
- Split the array into individual words using a separator [on implementation, realized this is completely unnecessary.]
- Iterate through the array comparing each item to the longest item so far
--- Initialize a variable, champion
--- For each item in the array, compare its length to champion
--- If item length > champion length, assign that item to the champion
--- Repeat for each item in the array
- Return the champion

*/
function findLongest(array){
  champion = array[0]
  for (var item in array) {
    if (array[item].length > champion.length){
      champion = array[item];
    };
  }
  return champion;
};

/*
Pseudocode: takes two objects and checks to see if the objects share at least one key-value pair (compareObj)
Input: Two objects
Output: Boolean true or false
How do we get there?
- Take two objects
- Iterate through each key in object 1, comparing it to all of the keys in object 2.
-- Set the first key in the object to current key
-- Loop through the keys in object2, comparing them to current key
---- If there is a match, compare the value at current key to the value and the matching key in object two
------ If the values match return true
---- If there is no match, move to the next key in object2 until we've looped through the entire object
-- Increment to the next key in object1
-- Repeat lines 37 - 40 until there are no more keys in object1
-- Return false
*/
function compareObj(object1, object2) {
  // I happened to see the syntax for this on the MDN page for for loops while troubleshooting the last method
  for (var prop1 in object1) {
    // Iterate through the keys in object2
    for (var prop2 in object2){
      // Compare the property from object1 to object2 properties
      if (prop1 === prop2) {
        // Return true if the keys and properties match
        if (object1[prop1] === object2[prop2]){
          return true;
        }
      }
    }
  }
  return false;
};

/*
Pseudocode: Generate random test data (randomWords)
Input: An integer
Output: An array of <input integer> randomly generated words conglomerations of letters, between 1 and 10 characters in length.
How do we get there?:
- Take an integer
- Create an array (wordArray)
- For the number of times up to integer, do the following:
-- create a variable wordLength that is a random number between 1 and 10
-- create a empty string (word)
-- For wordLength number of times:
---- Generate a random letter and add it to word
-- Repeat until counter matches integer
- Return wordArray

*/

function randomWords(integer){
  var wordArray = [];
  var passes = 0;
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  while (passes < integer) {
    word = ""
    wordLength = Math.floor(Math.random() * 10)
    // console.log("wordLength is " + wordLength);
    for(var i = 0; i < wordLength; i++) {
      index = Math.floor(Math.random() * 26);
      word += alphabet[index];
    }
    passes++;
    wordArray.push(word);
  }
  return wordArray
}

// Driver Code
/*console.log(findLongest(["Derrick", "Derrick Carr", "I am become Galactus", "banana"]));

console.log(findLongest(["a", "bb", "ggggggg", "llllllllllll", "ccc"]));

var obj1 = {name: "Steven", age: 54};
var obj2 = {name: "Tamir", age: 54};
console.log(compareObj(obj1, obj2));

var obj3 = {name: "Steven", age: 54};
var obj4 = {name: "Tamir", age: 13};
console.log(compareObj(obj3, obj4));
*/

for(var count = 0; count < 10; count++){
  // I couldn't chain the methods without changing my randomWords function to print its array or making findLongest print its input array, and I didn't think that change was worth it to save a line or two down here with
  // console.log(findLongest(randomWords(wordNumber)));
  wordNumber = Math.floor(Math.random() * 5) + 1;
  var words = randomWords(wordNumber);
  console.log(words);
  console.log(findLongest(words));
}