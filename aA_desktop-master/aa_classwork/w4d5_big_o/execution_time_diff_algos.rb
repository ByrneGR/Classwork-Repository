# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to compare the time complexity of one method to another
# Be able to recognize when time or space complexity can be improved

# Given a list of integers find the smallest number in the list.

# Phase I
# First, write a function that compares each element to every other element
# of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function? # O(n^2)

def my_min(arr)
    arr_1 = arr.dup
    (0...arr.length).each do |i|
        arr_1.delete(arr[i])
        if arr_1.all? { |other_num| num < other_num }
           return arr[i] 
        end
    end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track
# of the minimum. What is the time complexity? # O(n)

def my_min(arr)
    min = arr.first
    (1...arr.length - 1).each do |i|
        if arr[i] < min
            min = arr[i]
        end
    end
    min
end

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous
# (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops.
# First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution. #Time complexity is O(n^2)

# def largest_contiguous_subsum(arr)
#     subs = []
#     arr.each_with_index do |ele_1, idx_1|
#         arr.each_with_index do |ele_2, idx_2|
#             subs << arr[idx_1..idx_2] if idx_1 <= idx_2
#         end
#     end
#     subs.map { |arr| arr.sum }.max
# end

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally
# of the largest sum. To accomplish this efficient space complexity, consider using two variables. One variable
# should track the largest sum so far and another to track the current sum. We'll leave the rest to you.

# def largest_contiguous_subsum(arr)
#     current = arr.first
#     max = arr.first
#     (1...arr.length).each do |i|

#     end
# end

require "byebug"

def largest_contiguous_subsum2(arr)
  largest = arr.first
  current = arr.first 
  (1...arr.length).each do |i|
    current = 0 if current < 0
    current += arr[i] 
    largest = current if current > largest
  end
  
  largest
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
# # possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])
