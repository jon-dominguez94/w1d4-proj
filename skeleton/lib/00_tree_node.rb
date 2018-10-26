require 'byebug'
class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil 
    @children = []
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end
  
  def parent=(node)
    if node == nil
      @parent.children.delete(self) unless @parent == nil
    else
      @parent.children.delete(self) if @parent != node && @parent
      node.children << self unless node.children.include?(self) 
    end
    @parent = node 
  end
  
  def add_child(node)
    node.parent = self
  end
  
  def remove_child(node)
    raise if !@children.include?(node)
    node.parent = nil
  end
  
  def dfs(target)
    return self if self.value == target
    @children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    return nil
  end
  
  def bfs(target)
    # debugger
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target
      queue += node.children
    end
    nil
  end
end