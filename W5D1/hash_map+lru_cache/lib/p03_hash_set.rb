require 'byebug'
class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash % num_buckets
    if !self.include?(key)
      if num_buckets == @count
        resize!
      end
      @store[num] << key
      @count += 1
    end    
  end

  def include?(key)
    # return false if key == []
    num = key.hash % num_buckets
    @store[num].include?(key)
  end

  def remove(key)

    num = key.hash % num_buckets
    if self.include?(key)
      @store[num].delete(key)
      @count -= 1
    end

  end

  private
  
  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times {self.store << []}
  end
end

set = HashSet.new
  # describe "#insert" do
  #   it "should correctly insert any kind of element" do
      # set.insert(50)
      # set.insert("howdy")
      # set.insert([])
      # set.insert({:a => 3, :b => 4})
      # debugger
      # p set
      # key = "howdy".hash % 8
      # key2 = 50.hash % 8
      # key3 = 49.hash % 8 
      # p set.include?(key)
      # p set.include?(key2)
      # p set.include?(key3)

      # expect(set.include?(50)).to be(true)
  #     expect(set.include?(49)).to be(false)

  #     expect(set.include?("howdy")).to be(true)
  #     expect(set.include?(:howdy)).to be(false)

  #     expect(set.include?([])).to be(true)
  #     expect(set.include?([[]])).to be(false)

  #     expect(set.include?({:a => 3, :b => 4})).to be(true)
  #     expect(set.include?({:b => 4, :a => 3})).to be(true)
  #   end
  # end