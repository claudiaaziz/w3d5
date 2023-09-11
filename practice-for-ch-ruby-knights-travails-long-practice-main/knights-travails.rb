require_relative 'poly_tree_node'
require_relative 'board'
require 'byebug'

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
        @board = Board.new
    end

    def new_move_positions(pos)
        row, col = pos
        new_moves = []

        KnightPathFinder.valid_moves(pos).select do |move|
            x, y = move

            if !considered_positions.include?([x,y])
                new_moves << [x,y]
                considered_positions << [x,y]
            end
        end

        new_moves
    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            current_node = queue.shift

            new_move_positions(current_node.value).each do |child|
                child_node = PolyTreeNode.new(child)
                child_node.parent = current_node

                queue << child_node
            end

        end

        @root_node
    end
end

kpf = KnightPathFinder.new([0,0])
p KnightPathFinder.valid_moves([2,1])
p kpf.new_move_positions([2,1])
p kpf.new_move_positions([2,1])
p kpf.build_move_tree
p kpf.considered_positions.length