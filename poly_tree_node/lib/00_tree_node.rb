require 'byebug'

class PolyTreeNode

  attr_reader :children, :value, :parent

    def initialize(value)
      @parent = nil
      @children = []
      @value = value
    end

    def add_child(child)
      child.parent = self
    end

    def remove_child(node)
      if children.include?(node)
        children.delete(node)
        node.parent = nil
      else
        raise "error"
      end
    end

    def parent=(node)
      # children.value.
      if self.parent.is_a?(PolyTreeNode)
        self.parent.children.delete(self)
      end
      if node.nil?
        @parent = nil
      else
        @parent = node
        node.children.push(self)

        #sets parent propoerty
        # add nodes to their parent's array of children
      end
    end

    def dfs(target_value)
      # debugger

      return self if self.value == target_value
      arr = []
      children.each do |child|
        result = child.dfs(target_value)
        return result unless result.nil?
      end

       nil
    end


    def bfs(target_value)
      des = [self]
      until des.empty?
        node = des.shift
        return node if node.value == target_value
          des += node.children
      end
      nil
    end
end
