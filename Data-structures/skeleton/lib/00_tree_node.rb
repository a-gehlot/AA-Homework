class PolyTreeNode
    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent = node
        unless node.nil? 
            node.children << self unless node.children.include?(self)
        end
    end
        

    
end