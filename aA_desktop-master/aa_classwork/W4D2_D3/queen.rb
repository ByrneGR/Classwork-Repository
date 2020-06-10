require_relative "slideable.rb"
require_relative "piece.rb"
class Queen < Piece
    include Slideable

    def symbol
        if self.color == :white
            "♕".white
        else
            "♕".red
        end
    end

    # def inspect
    #     "♕"
    # end

    def to_s
        "♕"
    end

    def move_dirs
        hor_vert_dir() + diag_dir()
    end
end