require_relative 'poly_tree_node'
require_relative 'board'

class KnightPathFinder
    attr_accessor :considered_positions, :move_tree
    attr_reader :board, :root_node

    def self.valid_moves(pos)
        row, col = pos

        valid = []
        valid << [row + 2, col - 1]
        valid << [row + 2, col + 1]
        valid << [row - 2, col + 1]
        valid << [row - 2, col - 1]
        valid << [row + 1, col - 2]
        valid << [row + 1, col + 2]
        valid << [row - 1, col + 2]
        valid << [row - 1, col - 2]

        # while valid.length < 8
        #         new_row = row + 2 
        #         new_col = col - 1
        #         valid << [new_row, new_col]
        #     end
        # end

        valid.select do |pos| 
            pos.all? {|coord| coord >= 0 && coord < 8}
        end
    end

    # def is_legal?(pos)
    #     pos.all? {|coord| coord >= 0 && coord < 8}
    # end

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
        KnightPathFinder.valid_moves(pos)

        row, col = pos

        (row...board.board.length).each do |x|
            (col...board.board.length).each do |y|
                if !considered_positions.include?(board[x][y])
                    considered_positions << [x][y] 
                end
            end
        end

        considered_positions
    end
end
