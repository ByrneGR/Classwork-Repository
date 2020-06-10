# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to recognize when and how time or space complexity can be improved
# Be able to compare different methods and discuss how changing inputs affects each one's overall runtime

# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string.
# Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

# Time complexity is O(n!)

def first_anagram?(str1, str2)
    all_words = str1.chars.permutation(str1.length).map { |arr| arr.join("") }
    all_words.include?(str2)
end

# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string,
# find the index of that letter in the second string (hint: use Array#find_index) and delete at that index.
# The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??
# Difference is that it does not find all the possible words of the first string, instead it checks one character to another.

def second_anagram?(str1, str2)
    str1.each_char do |char1|
        if str2.index(char1)
            same = str2.index(char1)
            str2[same] = ""
        end
    end
    str2.size == 0
end

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically.
# The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??
# Worse because sorting is quicksort and quicksort is O(n log(n)) but second_anagram is O(n)

def third_anagram?(str1, str2)
    str1.chars.sort == str2.chars.sort
end

# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times
# each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

# This method does not work because if we had "ccat" and "catt", it would return true when it's false!

def fourth_anagram?(str1, str2)
    (str1.chars - str2.chars).empty? && str1.size == str2.size
end

#-----------Works----------------#
def fourth_anagram?(str1, str2)
    hash_chars(str1) == hash_chars(str2)
end

def hash_chars(str)
    count = Hash.new(0)
    str.each_char { |char| count[char] += 1 }
    count
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("catt", "ccat")    #=> true