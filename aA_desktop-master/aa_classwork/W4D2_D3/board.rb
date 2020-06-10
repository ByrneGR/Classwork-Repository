
require_relative "piece.rb"
require_relative "rook.rb"
require_relative "queen.rb"
require_relative "knight.rb"
require_relative "bishop.rb"
require_relative "pawn.rb"
require_relative "king.rb"
require_relative "NullPiece.rb"

class Board

    attr_reader :grid
    def initialize
        @grid = Array.new(8) { Array.new(8) }
        populate_board
    end

    
    def populate_board
        # debugger
        @grid.each_with_index do |r, i|
            @grid.each_with_index do |c, j|
                if i == 6
                    @grid[i][j] = Pawn.new(:white, self, [i, j])
                elsif i == 1
                    @grid[i][j] = Pawn.new(:black, self, [i, j])
                elsif i == 7
                    @grid[i][0] = Rook.new(:white, self, [i, j])
                    @grid[i][7] = Rook.new(:white, self, [i, j])
                    @grid[i][1] = Knight.new(:white, self, [i, j])
                    @grid[i][6] = Knight.new(:white, self, [i, j])
                    @grid[i][2] = Bishop.new(:white, self, [i, j])
                    @grid[i][5] = Bishop.new(:white, self, [i, j])
                    @grid[i][4] = King.new(:white, self, [i, j])
                    @grid[i][3] = Queen.new(:white, self, [i, j])
                elsif i == 0
                    @grid[i][0] = Rook.new(:black, self, [i, j])
                    @grid[i][7] = Rook.new(:black, self, [i, j])
                    @grid[i][1] = Knight.new(:black, self, [i, j])
                    @grid[i][6] = Knight.new(:black, self, [i, j])
                    @grid[i][2] = Bishop.new(:black, self, [i, j])
                    @grid[i][5] = Bishop.new(:black, self, [i, j])
                    @grid[i][4] = King.new(:black, self, [i, j])
                    @grid[i][3] = Queen.new(:black, self, [i, j])
                else
                    @grid[i][j] = NullPiece.instance()
                end
            end
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid_start_pos?(pos)
        !self[pos].is_a?(NullPiece)
    end

    def move_piece(start_pos, end_pos)
        pos = start_pos + end_pos
        pos.each {|ele| raise "Pos out of bounds" if !(0..7).include? ele}
        raise "No piece at start pos" if !valid_start_pos?(start_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance()
    end
end



board = Board.new()

board.grid.each {|row| print row}
puts
puts

# p board.grid[1][3].diag_dir
# board.move_piece([0, 1], [2,3])


board.move_piece([1,1], [2,1])
puts "aa"
p board.grid[0][4].moves
puts "bb"


board.grid.each_with_index do |row, i|
    board.grid.each_with_index do|col, j|
        print (board.grid[i][j].to_s + " ")
    end
    puts
end

# p board.grid


#    0   1   2    3   4   5   6   7    
# 0. [], [], [], [], [k], [], [], []

# 1. [], [], [], [], [], [], [], []

# 2. [], [], [], [], [], [], [], []

# 3. [], [], [], [], [], [], [], []

# 4. [], [], [], [], [], [], [], []

# 5. [], [], [], [], [], [], [], []

# 6. [], [], [], [], [], [], [], []

# 7. [], [], [], [], [k], [], [], []


# [nil, P, P, P, P, P, P, P]
# [P, P, P, P, P, P, P, P]
# [nil, P, nil, nil, nil, nil, nil, nil]
# [nil, nil, nil, nil, nil, nil, nil, nil]
# [nil, nil, nil, nil, nil, nil, nil, nil]
# [nil, nil, nil, nil, nil, nil, nil, nil]
# [P, P, P, P, P, P, P, P]
# [P, P, P, P, P, P, P, P]