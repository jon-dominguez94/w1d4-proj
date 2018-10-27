require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  
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
    children_nodes = []
    (0..2).each do |row|
      (0..2).each do |col|
        if board.empty?([row,col])
          temp_board = @board.dup
          temp_board[[row,col]] = next_mover_mark
          prev_mover_mark = next_mover_mark == :x ? :o : :x
          children_nodes << TicTacToeNode.new(temp_board, prev_mover_mark, [row,col])
        end
      end
    end
    children_nodes
  end
end
