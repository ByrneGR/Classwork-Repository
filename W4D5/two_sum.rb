require 'byebug'
def two_sum?(arr, target_num)
  hash = Hash.new

  arr.each do |ele|
    debugger
   return true if hash[target_num - ele] #this will return nil if the value doesnt exist
   hash[ele] = true  #build hash with eles as keys and true as value {0=>true, 1=>true}
  end    
    return false
      #p hash[ele]

end  

#arr = [0, 1, 5, 7]
#arr = [3, 7, 5, 2]
#p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false