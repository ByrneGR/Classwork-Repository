class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    str_arr = self.map { |ele| ele.to_s } # ["1", "2", "3"]
    arr_int = str_arr.join("").to_i # "123".to_i = 123
    arr_int.hash #123.hash
  end
end

class String 
  def hash
    result = [] # "ab" [0,1] [01]
    alpha = ("a".."z").to_a
    self.each_char {|char| result << alpha.index(char.downcase)}
    result.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.sort.to_s.hash
    # 0
  end
end

# a = {a: "a"}
# b = {a: "a", b: "b"}
# p a.to_s.hash
# p b.to_s.hash