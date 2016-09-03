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

=begin
Pseudocode: Shell Sort

Consider an array
Determine the step gaps (g) (based on weblink length of array, divided by 2, rounded down)
Loop through the array while g > 0
  - Create subarrays that contains an number at index and index+g numbers
  - Sort each subarray least to greatest
  - Reinsert each subarray into main array with its values sorted (combine into one array)
  - Continue creating subarrays until end of main array
  - Change g to g/2 rounded down to the nearest whole number
  - Repeat above steps with new g value
Return the combined array
=end

# Attempt at grouping by array [incomplete]
# def shell_sort(arr)
#   gap = arr.length/2 #automatically floored
#   while gap > 0
#     sub_array = []
#     sub_array_idx = 0 #We're creating a second index to move the main array at gap intervals
#     # Create sub_array for each gap increment. These are each a pass at that gap
#     while sub_array_idx < arr.length
#       arr[sub_array_idx] << sub_array
#       sub_array_idx += gap
#     end
#     sub_array. do |num|
#       p num
#       p arr.next
#       if arr.next < num
#         arr.next, num = num, arr.next
#       end
#     end
#   gap = gap/2
#   end
# end

def shell_sort(array)
  p array
  gap = array.length/2
  while gap > 0
    puts "gap is currently #{gap}"
    idx = 0
    while idx < array.length - gap
      # while loop to move multiple steps
      while array[idx + gap] < array[idx]
        array[idx+gap],array[idx] = array[idx],array[idx+gap]
        if idx > 0
          idx -= 1
        else
          break
        end
      end
      idx += 1
    end
    gap = gap/2
    p "-" * 10
   p array
  end
end

shell_sort((1..120).to_a.shuffle)

# def shell_sort(num_arr)
#   gap = num_arr.length/2 #automatically passed through .floor
#   while gap > 0
#     sub_index = 0
#       while sub_index < num_arr.length
#         sub_values = []
#         sub_values << sub_index
#         new_arr = []
#         new_arr << num_arr[sub_index]
#         sub_index += gap
#       end
#       #sort new_arr
#       num_arr[]

#     gap /= 2

#   end
# end

