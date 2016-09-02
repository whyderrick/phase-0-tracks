=begin
Pseudocode

Take an array and an integer. Search array for integer. Return index of that integer. Don't use built-in array methods.

Take an array, an integer
  Search array for a number that matches the integer
  If number doesn't match, keep searching
  Return the index of the matching number
Stop

Method takes array and integer as input
Loop through the array, comparing each number to integer
  - If it matches, return index at that point in array
  - Otherwise return nil.

=end

def search_arr(array, n)
  idx = 0
  while idx < array.length
    puts "Index is #{idx} and value is #{array[idx]}"
    return idx if array[idx] == n
    idx += 1
  end
end
