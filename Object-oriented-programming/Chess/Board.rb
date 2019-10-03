class Board
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        (0..8).each do |col|
            (0..1).each { |row| @rows[row][col] = Piece.new }
            (6..7).each { |row| @rows[row][col] = Piece.new }
            (2..5).each { |row| @rows[row][col] = nil }
        end
    end

    def move_piece(start_pos, end_pos)
        i, j = start_pos
        a, b = end_pos
        if !@rows[i][j].is_a?(Piece)
            raise ArgumentError.new("Not a piece")
        end
        @rows[a][b] = @rows[i][j]
        @rows[i][j] = nil
    end

end

class Piece

end