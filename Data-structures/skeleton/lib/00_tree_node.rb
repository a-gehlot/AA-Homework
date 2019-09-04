class PolyTreeNode
    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if node == nil
            @parent = nil
        else
            @parent = node
            node.children << self unless node.children.include?(self)
        end
    end
        

    
end