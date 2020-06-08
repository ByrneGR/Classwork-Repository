class MaxIntSet
  attr_accessor :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)  
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @store[num] = true
  end
  
  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @num_buckets = num_buckets
  end

  def insert(num) 
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
     @store[num] == true
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet 
  attr_reader :count
  attr_accessor :num_buckets, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    if !self.include?(num)
      if num_buckets == self.count
        resize!
      end  
      @store[num] = true
      @count += 1
    end  
  end

  def remove(num)
    if self.include?(num)
      @store[num] = false
      @count -= 1
    end
  end

  def include?(num)
    @store[num] == true
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
  private


  def num_buckets
    @store.length
  end

  def resize! 
      num_buckets.times { self.store << [] }
  end
end

