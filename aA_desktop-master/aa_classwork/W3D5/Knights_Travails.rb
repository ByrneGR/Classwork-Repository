require "PolyTreeNode"

class KnightPathFinder 
    def initialize(pos)
        @considered_positions = []
        @grid = Array.new(8) {Array.new(8,nil)}
        @grid.map! do |row|
            row.map! {|ele| ele = "_"}
        end
        build_move_tree(pos)
    end
    
    def build_move_tree(pos)
        @root_node = PolyTreeNode.new(pos)
        queue = [root_node]
        until queue.empty?
            current_pos = queue.shift
            get_possible_moves(current_pos).each do|position|
                next_move = current_pos.add_child(PolyTreeNode.new(position))
                queue << next_move
            end
        end
    end

    def find_path(target)
        target.dfs(target)
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
        
        clean_possible_moves = possible_moves.select do |position|
            @grid[position[0]][position[1]] == "_" && !@considered_positions.include?(position) && position[0] >= 0 && position[1] >= 0
        end
        clean_possible_moves
    end


end


board = KnightPathFinder.new([0,0])
board.find_path(1, 6)
