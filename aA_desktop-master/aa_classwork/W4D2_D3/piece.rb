

class Piece
    
    attr_reader :pos, :board, :color
    def initialize (color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end


    def inspect
        "P"
    end
end









#    0   1   2    3   4   5   6   7    
# 0. [], [], [], [], [], [], [], []

# 1. [], [], [], [], [], [], [], []

# 2. [], [], [P], [], [R], [], [], []

# 3. [], [], [1,1], [], [], [], [], []

# 4. [], [], [], [], [], [], [], []

# 5. [], [], [], [], [], [], [], []

# 6. [], [], [], [], [], [], [], []

# 7. [], [], [], [], [], [], [], []

dx, dy = [1, -1]


# module Searchable
#     def dfs(target)
#         return self if self.value == target
#         p self
#         self.children.each do |child| 
#             child_result = child.dfs(target)
#             return child_result if child_result
#         end
#         return nil 
#     end

#     def bfs(target)
#         queue = [self]
#         until queue.empty?
#             ele = queue.shift
#             if ele.value == target
#                 return ele
#             else
#                 queue += ele.children
#             end
#         end
#         nil
#     end
    
# end


# class PolyTreeNode

#     include Searchable

#     attr_accessor :value, :parent, :children

#     def initialize(value)
#         @value = value
#         @parent = nil
#         @children = []
#     end

#     def parent=(node_instance)
#         if node_instance != @parent
#             self.parent.children.delete(self) if parent
#             @parent = node_instance
#             node_instance.children << self  if node_instance
#         end
#     end

#     def add_child(new_child)
#         new_child.parent=(self)
#     end

#     def remove_child(child)
#         raise "node not child" if !child.parent 
#         child.parent=(nil)
#     end

#     def inspect
#         "val: #{value}, parent: #{parent.value}, children: #{children.map {|child| child.value}}"
#     end
# end
