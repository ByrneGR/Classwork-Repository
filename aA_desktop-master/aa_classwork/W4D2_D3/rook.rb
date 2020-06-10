require_relative "piece.rb"
require_relative "slideable.rb"

class Rook < Piece
    def symbol
        if self.color == :white
            "♖".white
        else
            "♖".red
        end
    end

    def to_s
         "♖"
    end

    def move_dirs
        hor_vert_dir
    end
end

