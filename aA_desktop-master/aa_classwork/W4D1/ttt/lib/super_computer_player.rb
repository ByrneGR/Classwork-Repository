require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    root = TicTacToeNode.new(game.board, mark)
    winning_moves = root.children.select { |child| child.winning_node?(mark) }
    if root.children.any? { |child| child.winning_node?(mark) }
      return winning_moves[0].prev_move_pos
    else
      not_losing_moves = root.children.select {|child| !child.losing_node?(mark)}
      return not_losing_moves[0].prev_move_pos
    end
    # p "test"
    # move_2 = root.children.each do |child| 
    #   child.children 
    #   winning_child_moves = move_2.children.select { |grandchild| grandchild.winning_node?(mark) }
    # end
    # p winning_child_moves
    # return winning_child_moves[0].prev_move_pos.prev_move_pos if !winning_child_moves.empty?
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new


  TicTacToe.new(hp, cp).run
end

