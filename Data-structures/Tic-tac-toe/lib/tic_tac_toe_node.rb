require_relative 'tic_tac_toe'


class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    (0..2).each do |row|
      (0..2).each do |child|
        if @board.empty?([row, child])
          dup = @board.dup
          node = TicTacToeNode.new(dup, :o, [row, child])
          children << node
        end
      end
    end
    children
  end


end
