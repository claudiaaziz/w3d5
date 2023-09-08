require_relative 'poly_tree_node'
require_relative 'board'

class KnightPathFinder
    def self.valid_moves(pos)
        
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @move_tree = [@root_node.value]
    end

    def build_move_tree
        @move_tree
    end

    def new_move_positions

    end
end