require 'byebug'
def anagram?(str_1, str_2)

  first_anagram?(str_1).include?(str_2)
end  

def first_anagram?(str)
  chars = str.split("")
  chars.permutation.to_a.map {|ele| ele.join("")}


end  

# p first_anagram?("cat")

p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true
