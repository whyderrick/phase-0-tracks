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
    console.log(item)
    if (item.length > champion.length){
      champion = item;
    };
  }
  return champion;
};

// Driver Code
console.log(findLongest(["Derrick", "Derrick Carr", "I am become Galactus", "banana"]));

console.log(findLongest(["a", "bb", "ggggggg", "llllllllllll", "ccc"]));