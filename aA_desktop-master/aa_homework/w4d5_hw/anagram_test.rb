require 'benchmark'

def my_anagram(str1, str2)
    run = Time.now
    str1.length == str2.length && (str1.chars - str2.chars)
    run - Time.now
end



def hash(str)
    count = Hash.new(0)
    str.each_char { |char| count[char] += 1 }
    count
end

def hash_anagram(str1, str2)
    hash(str1) == hash(str2)
end

puts my_anagram("abcdefghijklmnop", "ponmlkjihgfedcba")