require "/Users/andrewgehlot/Documents/App Academy/Aa-homeworks/Data-structures/PolyNodeTree/lib/00_tree_node.rb"

class KnightPathFinder

    DELTAS = [[-1, 2], [-1, -2], [1, -2], [1, 2], [-2, 1], [-2, -1], [2, 1], [2, -1]]

    def initialize(starting_position)
        @root_node = starting_position
        # self.root_node
    end

    def self.valid_moves(pos)
        i, j = pos
        moves_array = []
        DELTAS.each do |d_i, d_j|
            move = [(i + d_i), (j + d_j)]
            if move.all? { |val| 0 < val && val < 8 }
                moves_array << move
            end
        end
        moves_array
    end

end

# kpf = KnightPathFinder.new([0, 0])
# kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
# kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]