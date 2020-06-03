require_relative "piece"
require_relative "null_piece"

class Board
    attr_reader :grid
    def initialize
    @grid = Array.new(8) {Array.new(8)} # creates grid skeleton
    fill_grid # populates board
    end 
    
    def [](position)
      row, col = position
      @grid[row][col]
    end  
    
    def []=(position, piece)
      row, col = position
      @grid[row][col] = piece
    end  

    def move_piece(start_pos, end_pos)
      start_row, start_col = start_pos
      end_row, end_col = end_pos

      # IF THERE IS A PIECE
      if !end_row.between?(0,7) || !end_col.between?(0,7) || !start_row.between?(0,7) || !start_col.between?(0,7)
        raise ArgumentError.new "Start or end position beyond the bounds of the board"

      elsif self.grid[start_row][start_col].is_a?(Piece) # Tests if pos has a piece
        piece = self.grid[start_row][start_col] # Saves piece as reference pointing to Piece instance
        self.grid[start_row][start_col] = NullPiece.instance # Replaces start_pos with NullPiece (no more piece)
        self.grid[end_row][end_col] = piece # Places piece on the desired end_pos  

      else
        # Raises error if the start_pos does not contain Piece
        raise ArgumentError.new "Start position does not contain a piece"
      end      
      
    end    

    private

    # Fills the grid with Pieces
    def fill_grid
      # Fills the first players side with Pieces
      self.grid[0..1].each do |row|
        row.each_with_index { |pos, i| row[i] = Piece.new}
      end
      #Fills the middle with instances of NullPiece
      null = NullPiece.instance
      self.grid[2..5].each do |row|
        row.each_with_index { |pos, i| row[i] = null}
      end
      #Fills the second players side with Pieces
      self.grid[6..7].each do |row|
        row.each_with_index { |pos, i| row[i] = Piece.new}
      end           
    end    

end    


if __FILE__ == $PROGRAM_NAME

board = Board.new
board.grid.each { |row| p row }
puts 
board.move_piece([1,1], [4,5])
board.grid.each { |row| p row }
puts
p board[[1,1]]


# Sliding pieces (Bishop/Rook/Queen)
# Stepping pieces (Knight/King)
# Null pieces (occupy the 'empty' spaces)
# Pawns (we'll do this class last)

#     0    1    2    3    4    5    6    7
# 0 [nil, nil, nil, nil, nil, nil, nil, nil]
# 1 [nil, nil, nil, nil, nil, nil, nil, nil]
# 2 [nil, nil, nil, nil, nil, nil, nil, nil]
# 3 [nil, nil, nil, nil, nil, nil, nil, nil]
# 4 [nil, nil, nil, nil, nil, nil, nil, nil]
# 5 [nil, nil, nil, nil, nil, nil, nil, nil]
# 6 [nil, nil, nil, nil, nil, nil, nil, nil]
# 7 [nil, nil, nil, nil, nil, nil, nil, nil]

end