require "/Users/andrewgehlot/Documents/App Academy/Aa-homeworks/Data-structures/PolyNodeTree/lib/00_tree_node.rb"

class KnightPathFinder

    def initialize(starting_position)
        @root_node = starting_position
    end

end

kpf = KnightPathFinder.new([0, 0])
kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]