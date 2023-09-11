require_relative 'poly_tree_node'
require_relative 'board'

class KnightPathFinder
    attr_accessor :considered_positions, :move_tree
    attr_reader :board, :root_node

    def self.valid_moves(pos)
        row, col = pos

        moves = [[2,1],[-2,-1],[2,-1],[-2,1],[1,2],[-1,-2],[1,-2],[-1,2]]
        vals = []

        while vals.length < 8
            moves.each do |position|
                x, y = position
                vals << [row + x, col + y]
            end
        end

        vals.select do |val| 
            val.all? {|coord| coord >= 0 && coord < 8}
        end
    end

    def initialize(start_pos)
        @considered_positions = [start_pos]
        @root_node = PolyTreeNode.new(start_pos)
        @move_tree = [@root_node.value]
        @board = Board.new
    end

    def new_move_positions(pos)
        row, col = pos

        KnightPathFinder.valid_moves(pos).select do |move|
            x, y = move
            if !considered_positions.include?([x,y])
                considered_positions << [x,y]
            end
        end

        considered_positions
    end

    def build_move_tree(end_pos)
        @move_tree
        until move_tree.empty?
            new_pos = move_tree.shift
            return end_pos if new_pos == end_pos
            @move_tree += new_move_positions(new_pos)
        end
        nil
    end
end

kpf = KnightPathFinder.new([0,0])
p KnightPathFinder.valid_moves([0,1])
p kpf.new_move_positions([0,2])
p kpf.build_move_tree([3,4])