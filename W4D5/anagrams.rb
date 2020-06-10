require 'byebug'
def anagram?(str_1, str_2)
  char_count(str_1) == char_count(str_2) 
end  

def char_count(str)
  hash = Hash.new(0)
  str.each_char {|char| hash[char] += 1}
  hash
end


# p first_anagram?("cat")

p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true
