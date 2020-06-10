require_relative "stepable.rb"
require_relative "piece.rb"

class Knight < Piece
    include Stepable
    def symbol
        if self.color == :white
            "♘".white
        else
            "♘".red
        end
    end

    # def inspect
    #     " ♘ "
    # end

    def to_s
        "♘"
    end



    def move_diffs
        [[- 2,- 1], [-2, 1],
        [-1,-2], [-1, 2],
        [1, -2], [1, 2],
        [2, -1], [2, 1]]
    end
end