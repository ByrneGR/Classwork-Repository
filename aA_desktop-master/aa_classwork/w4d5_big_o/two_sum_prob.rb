# Learning Goals
# Be able to reason about a difficult problem and think of ways to solve it.
# Be able to determine and explain the time and space complexity of a method
# Be able to recognize when time or space complexity can be improved
# Know some common tricks to improve time or space complexity

# BRUTE FORCE
# The time complexity for the below method is O(n^2)
def bad_two_sum?(arr, target)
    pairs = arr.combination(2)
    pairs.any? { |pair| pair.sum == target }
end

# SORTING
# With a sorted array, I can use the pointer method, although the pointer performance is O(n) itself, since we had to use
# sort (quicksort) at the beginning, this methodb becomes O(n log (n))

def okay_two_sum?(arr, target)
    arr.sort!
    i = 0
    j = arr.length - 1
    while i < j
        if arr[i] + arr[j] == target
            return true
        elsif arr[i] + arr[j] < target
            i += 1
        elsif arr[i] + arr[j] > target
            j -= 1
        end
    end
    false
end

# HASHMAP

# def two_sum?(arr, target)
#     hash = {}
#     arr.each do |num|
#         if hash[target - num]
#              return true
#         end
#         hash[num] = true
#     end
#     false
# end

# def two_sum?(arr, target)
#     hash = {}
#     arr.each do |num|
#         if hash[target - num]
#              return [arr.index(target - num), arr.index(num)]
#         end
#         hash[num] = true
#     end
#     false
# end

def two_sum?(arr, target)
    complements = {}
    arr.each_with_index do |el, i|
        complement, j = complements[target - el]
        return [i, j] if complement
        complements[el] = [el, i]
    end
    nil
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false