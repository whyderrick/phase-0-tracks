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


If a key is the same, check if the values also match

*/

// Driver Code
console.log(findLongest(["Derrick", "Derrick Carr", "I am become Galactus", "banana"]));

console.log(findLongest(["a", "bb", "ggggggg", "llllllllllll", "ccc"]));

/*
Pseudocode: takes two objects and checks to see if the objects share at least one key-value pair
Input:
Output:
How do we get there?

*/