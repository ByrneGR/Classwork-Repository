class PolyTreeNode

    attr_reader :value, :parent, :children


    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(passed_node)
        @parent = passed_node
        return nil if passed_node == nil
        passed_node.children << self if !passed_node.children.include?(self)
        

    end
    
    def inspect
        "val: #{value}, parent: #{parent.value} children: #{children.map {|child| child.value}}"
    end
end

