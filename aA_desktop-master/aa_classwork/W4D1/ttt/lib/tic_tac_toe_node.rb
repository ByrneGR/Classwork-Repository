require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board, @next_mover_mark, @prev_move_pos = board, next_mover_mark, prev_move_pos
  end

  def children
    children = []
    @next_mover_mark
    (0..2).each do |row|
      (0..2).each do |col|
        if @next_mover_mark == :o
         next_mover_mark = :x
        else
         next_mover_mark = :o
        end
        pos = [row, col]
        if @board.empty?(pos)
          copy_board = @board.dup
          prev_move_pos = pos
          
          copy_board[pos] = @next_mover_mark
          children << TicTacToeNode.new(copy_board, next_mover_mark, pos) 

        end        
      end
    end
    return children
  end




  def losing_node?(evaluator)
    
    return false if @board.winner == evaluator && @board.won?
    
    return true if @board.winner != evaluator && @board.won?

    if evaluator == @next_mover_mark
      children.all? { |child| child.losing_node?(evaluator)}
    else
      children.any? { |child| child.losing_node?(evaluator) }
    end

  end

  def winning_node?(evaluator)
    return true if @board.winner == evaluator 
    return false if @board.winner != evaluator

    if evaluator == @next_mover_mark
      children.all? { |child| child.winning_node?(evaluator)}
    else
      children.any? { |child| child.winning_node?(evaluator) }
    end
  end

  
  # This method generates an array of all moves that can be made after
  # the current move.
end
