require_relative "PolyTreeNode.rb"

class KnightPathFinder 
    def initialize(pos)
        @considered_positions = []
        @grid = Array.new(8) {Array.new(3,nil)}
        @grid.map! do |row|
            row.map! {|ele| ele = "_"}
        end
        build_move_tree(pos)
    end
    
    def build_move_tree(pos)
        @root_node = PolyTreeNode.new(pos)
        queue = [@root_node]
        until queue.empty?
            current_node = queue.shift
            current_pos = current_node.value
            @considered_positions << current_pos
            get_possible_moves(current_pos).each do |position|
                next_move = PolyTreeNode.new(position)
                current_node.add_child(next_move)
                queue << next_move
            end
        end
    end

    def find_path(target)
        node = @root_node.dfs(target)
        trace_path_back(node).unshift(@root_node.value)
    end

    def trace_path_back(node)
        path = []
        until node.parent.nil?
            path.unshift(node.value)
            node = node.parent
        end
        path
    end




    #     pos.add_child(get_possible_moves(pos.value))
    # end

    def get_possible_moves(pos)
        possible_moves = []
        row, col = pos
        possible_moves << [row + 2, col - 1]
        possible_moves << [row + 2, col + 1]
        possible_moves << [row - 2, col - 1]
        possible_moves << [row - 2, col + 1]
        possible_moves << [row + 1, col - 2]
        possible_moves << [row + 1, col + 2]
        possible_moves << [row - 1, col - 2]
        possible_moves << [row - 1, col + 2]
        
        return [] if possible_moves.empty?
        clean_possible_moves = possible_moves.select do |position|
            !@considered_positions.include?(position) && position[0] >= 0 && position[1] >= 0 && position[0] <= 8 && position[1] <= 8 
        end
        clean_possible_moves
    end


end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

