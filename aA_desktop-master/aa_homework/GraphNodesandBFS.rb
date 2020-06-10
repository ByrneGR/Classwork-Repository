require "set"

class GraphNode
    attr_accessor = :val, :neighbors

    def initialize(val)
        self.val = val
        self.neighbors = []
    end

    def add_neighbor(node)
        self.ngithbors << node
    end
end

def bfs(start_node, target)
    queue = [start_node]
    visited = Set.new

    until queue.empty?
        node = queue.shift
        unless visited.include?(node)
            return node.val if node.val == target
            visited.add(node)
            quene += node.neighbors
        end
    end
    nil
end

