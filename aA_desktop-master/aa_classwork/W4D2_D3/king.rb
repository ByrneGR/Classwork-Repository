require_relative "stepable.rb"
require_relative "piece.rb"
class King < Piece
    include Stepable
    def symbol
        if self.color == :white
            "♔".white
        else
            "♔".red
        end
    end

    # def inspect
    #     "♔"
    # end

    def to_s
        "♔"
    end

    def move_diffs
        [[-1, 0], [1, 0], 
        [0, 1], [0, -1], 
        [-1, -1], [1, 1], 
        [1, -1], [-1, 1]]
    end
end