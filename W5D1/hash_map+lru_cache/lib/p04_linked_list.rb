class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  attr_accessor :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
   
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next 
    update
    # if the head .next no longer == tail means we appended
  end

  def last
    @tail.prev
    update
  end

  # Head = Node
  # Store  
  # Tail = Node
  # https://www.rubyguides.com/2017/08/ruby-linked-list/
  def empty?
    #self.tail != @head.next
    self.tail.prev == self.head && self.head.next == self.tail

  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    @tail_prev = node
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

# list = LinkedList.new
# # p list
# # p list.head.next
# # p list.tail.prev


# #describe LinkedList do
# k_v_pairs = { first: 1, second: 2, third: 3 }

#     list_2 = LinkedList.new
#     k_v_pairs.each do |key, val|
#       list.append(key, val)
#     end  

# p list
# puts
# p list_2
