class PolyTreeNode
    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        old_parent = self.parent
        @parent = node
        unless @parent == nil || old_parent == @parent
            node.children << self
            old_parent.children.delete(self) unless old_parent == nil
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if self.children.include?(child)
            child.parent = nil
        else 
            raise "passed argument is not a child"
        end
    end

    def dfs(descendant)
        return self if self.value == descendant
        self.children.each do |child|
            search_result = child.dfs(descendant)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(descendant)
        queue = [self]
        until queue.empty?
            el = queue.shift
            return el if el.value == descendant
            el.children.each { |child| queue << child }
        end
    end
        
end

