require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    game_state = TicTacToeNode.new(game.board, mark)
    node = game_state.children.find { |child| child.winning_node?(mark) }
    return node.prev_move_pos if node

    node = game_state.children.find { |child| !child.losing_node?(mark) }

    return node.prev_move_pos if node

    raise "cannot find winning move"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
