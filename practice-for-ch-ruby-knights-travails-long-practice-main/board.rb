class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8, '_') }
    end

    def render
        board.each do |row|
            puts row.join(" ")
        end
    end
end

omar = Board.new
omar.render