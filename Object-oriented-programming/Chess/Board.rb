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

module Slideable
    HORIZONTAL_DIRS = [
        [0,1],
        [1,0],
        [0,-1],
        [-1,0]
    ]
    DIAGONAL_DIRS = [
        [1,1],
        [-1,1],
        [1,-1],
        [-1,-1]
    ]
    
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def moves
        poss_moves = []
        deltas = move_dirs
        deltas.each do |coord|
            poss_moves.concat(grow_unblocked_moves_in_dir(coord[0],coord[1])
        end
        poss_moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        new_pos = [pos[0] + dx, pos[1] + dy]
end

module Stepable

end

class Piece

end