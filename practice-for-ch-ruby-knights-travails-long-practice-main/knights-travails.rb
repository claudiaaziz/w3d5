require_relative 'poly_tree_node'
require_relative 'board'

class KnightPathFinder
    attr_accessor :considered_positions, :move_tree
    attr_reader :board, :root_node

    def self.valid_moves(pos)
        pos.all? {|coord| coord >= 0 && coord < 8}
    end

    def initialize(start_pos)
        @considered_positions = [start_pos]
        @root_node = PolyTreeNode.new(start_pos)
        @move_tree = [@root_node.value]
        @board = Board.new
    end

    def build_move_tree
        @move_tree 
    end

    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)?

        row, col = new_move_positions

        (row...board.length).each do |row|
            (col...board.length).each do |col|
                if !considered_positions.include?(board[row][col])
                    considered_positions << [row][col] 
                end
            end
        end

        considered_positions
    end
end
