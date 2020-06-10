# MAX WINDOWED RANGE

# Learning Goals
# Get practice approaching a difficult problem using algorithms
# Be able to explain the time complexity of your solution
# Know the differences between a stack and a queue
# Be able to use simple data structures to build more complicated ones

# Phase 1: Naive Solution
# One approach to solving this problem would be:

# Initialize a local variable current_max_range to nil.
# Iterate over the array and consider each window of size w. For each window:
# Find the min value in the window.
# Find the max value in the window.
# Calculate max - min and compare it to current_max_range. Reset the value of current_max_range if necessary.
# Return current_max_range.

def windowed_max_range(arr, window_size)
    current_max_range = nil
    bound = window_size - 1
    (0...arr.length - 1).each do |i|
        if arr[i..(i + bound)].minmax.inject(:-).abs < arr[i + 1..((i + 1) + bound)].minmax.inject(:-).abs
            current_max_range = arr[i + 1..((i + 1) + bound)].minmax.inject(:-).abs
        end
    end
    current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8