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

    d
end
