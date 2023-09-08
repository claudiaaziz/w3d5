class PolyTreeNode
    attr_reader :value, :children, :parent

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end 

    def parent=(node)
        self.parent.children.delete(self) if self.parent != nil
        @parent = node
        @parent.children << self if @parent != nil  
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise 'error' if child.parent.nil?
        child.parent = nil
    end
    
    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            value = child.dfs(target)
            return value if value
        end
        nil
    end

    def inspect
        @value
    end
end
