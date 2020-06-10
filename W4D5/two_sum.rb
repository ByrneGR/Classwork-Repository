require 'byebug'
def two_sum?(arr, target_num)
  hash = Hash.new

  arr.each do |ele|
    return true if hash[target_num - ele]
    hash[ele] = true
  end
  false  
end  

arr = [0, 1, 5, 7]
#arr = [3, 7, 5, 2]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false


   #this will return nil if the value doesnt exist
 #build hash with eles as keys and true as value {0=>true, 1=>true}