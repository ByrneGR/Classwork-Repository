require 'byebug'
#O(n^2)quadratic - go through each item in the array twice for every item in the array
def my_min_1(list)
  min_num = nil

  list.each do |num|
    clone = list.dup
    clone.delete(num)
  min_num = num if clone.all? {|ele| num < ele}
  end
  min_num
end  


#O(n)linear 
def my_min_2(list)
  min = 0
  i = 0
  while i < list.length
    if list[min] > list[i]
      min = i
    end
  i += 1
  end
  list[min]    
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1(list)  # =>  -5
# p my_min_2(list)  # =>  -5

# O(n^5) polynomial

def largest_contiguous_subsum(list)
  max = subsums(list).first.sum
  subsums(list).each do |sub|
    sum = sub.inject {|accum, ele| accum + ele}
      if sum > max
        max = sum
      end
  end        
  max
end

def subsums(list)
  subs = []
  (0...list.length).each do |start|
    (start...list.length).each do |finish|
      subs << list[start..finish]
    end  
  end
  subs
end  

def largest_contiguous_subsum_b(list)
  largest = list.first
  current = list.first

  (0...list.length).each do |i|
    current = list[i]

end




list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_b(list) # => 8 (from [7, -6, 7])
# p subsums(list)

# list = [-5, -1, -3]
# largest_contiguous_subsum(list) # => -1 (from [-1])