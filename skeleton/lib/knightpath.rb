require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder
  
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @visited_positions = [pos]
    build_move_tree
  end
  
  def build_move_tree
    # debugger
    queue = [@root_node]
    until queue.empty?
      current_node = queue.shift
      new_move_positions(current_node.value).each do |pos|
        child = PolyTreeNode.new(pos)
        child.parent = current_node
        queue << child
      end 
      
    end
    
  end
  
  def valid_moves(pos)
    all_moves = []
    row, col = pos
    all_moves += get_north(pos) + get_south(pos) + get_west(pos) + get_east(pos)
    all_moves.select {|pos| pos.all? {|el| el.between?(0,7)}} 
  end
  
  def new_move_positions(pos)
    # debugger
    potential_moves = valid_moves(pos)
    potential_moves -= @visited_positions
    @visited_positions += potential_moves
    potential_moves
  end
  
  private
  
  def get_north(pos)
    row, col = pos
    [[row - 3, col + 1], [row - 3, col - 1]]
  end
  
  def get_south(pos)
    row, col = pos
    [[row + 3, col + 1], [row + 3, col - 1]]
  end
  
  def get_east(pos)
    row, col = pos
    [[row - 1, col + 3], [row + 1, col + 3]]
  end
  
  def get_west(pos)
    row, col = pos
    [[row - 1, col - 3], [row + 1, col - 3]]
  end
end