require "/Users/andrewgehlot/Documents/App Academy/Aa-homeworks/Data-structures/PolyNodeTree/lib/00_tree_node.rb"

class KnightPathFinder

    attr_reader :root_node

    DELTAS = [[-1, 2], [-1, -2], [1, -2], [1, 2], [-2, 1], [-2, -1], [2, 1], [2, -1]]

    def initialize(starting_position)
        @start_pos = starting_position
        @considered_positions = [starting_position]
        @root_node = PolyTreeNode.new(starting_position)

        build_move_tree
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

    def new_move_positions(pos)
        KnightPathFinder::valid_moves(pos)
            .reject { |move| @considered_positions.include?(move) }
            .each { |move| @considered_positions << move }
    end

    def build_move_tree
        nodes = [@root_node]
        until nodes.empty?
            el = nodes.shift

            coords = el.value
            new_move_positions(coords).each do |position|
                next_node = PolyTreeNode.new(position)
                el.add_child(next_node)
                nodes << next_node
            end
        end
    end


    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_pos)
        path = []

        until end_pos.parent == nil
            path << end_pos.parent.value
            end_pos = end_pos.parent
        end
        path.reverse
    end



end

kpf = KnightPathFinder.new([0, 0])
kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]