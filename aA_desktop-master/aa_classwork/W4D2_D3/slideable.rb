module Slideable

    HORIZONTAL_VERTICAL_DIRS = [ [-1, 0], [1, 0], [0, 1], [0, -1] ]
    DIAGONAL_DIRS = [ [-1, -1], [1, 1], [1, -1], [-1, 1] ]

    def hor_vert_dir
        HORIZONTAL_VERTICAL_DIRS
    end

    def diag_dir
        DIAGONAL_DIRS
    end

    def moves(cur_pos)
        directions = move_dirs
        moves = []
        directions.each do |direction|
            moves << grow_unblocked_moves_in_dir(direction[0], direction[1])
        end
    end

    def is_valid?(pos_x, pos_y)
        @board[pos_x, pos_y].is_a?(NullPiece) && pos_x > -1 && pos_x < 8 && pos_y > -1 && pos_y < 8
    end

    private
    def move_dirs
        raise "You need to define move_dirs"
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []
        pos_x = self.pos[0]
        pos_y = self.pos[1]
        our_color = @board[pos_x, pos_y].color
        while true
            pos_x = pos_x + dx
            pos_y = pos_y + dy
            break if !is_valid?(pos_x, pos_y) && @board[pos_x, pos_y].color == our_color

            if @board[pos_x, pos_y].color != our_color
                moves << [pos_x, pos_y]
                break
            end
            moves << [pos_x, pos_y]
        end
    end
end
