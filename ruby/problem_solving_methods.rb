=begin
Pseudocode

Take an array and an integer. Search array for integer. Return index of that integer. Don't use built-in array methods.

Take an array, an integer
  Search array for a number that matches the integer
  If number doesn't match, keep searching
  Return the index of the matching number
Stop

Method takes array and integer as input
Loop through the array, comparing each number to integer search how
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
# Each broke for us. Need to research how to use it.


=begin
Release 1: Calculate Fibonacci Numbers

Method takes an integer as input
  Create a new array that contains the values 0 and 1 (possible array inside method = [0,1])
  Until array length is equal to integer given
  - Add last and second-to-last number in array together
  - Push result to array within method
  Return the array of sums
=end

def fibonacci(num)
  fib_arr = [0, 1]
  if num == 0 || num == 1
    return fib_arr[num]
  else
    i = 2
    until fib_arr.length == num
      sum = fib_arr[-2] + fib_arr[-1]
      fib_arr.push(sum)
      i += 1
    end
  end
  fib_arr
end

fibonacci(100).last == 218922995834555169026