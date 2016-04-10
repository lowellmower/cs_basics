require_relative 'tree_node.rb'

class BinaryTree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def empty?
    @root.nil?
  end

  def insert(val)
    @root = insert_node(@root, val)
  end

  def find(val)
    return find_value_node(@root, val)
  end

  def size
    return size_node(@root)
    # return iterative_size
  end

  def depth
    return depth_node(@root)
  end

  def remove(t)
    t = self.find(t)
    return @root = nil if @root == t
    if t.left && t.right
      next_node = find_successor(t)
      data = next_node.data
      remove(next_node)
      t.data = data
      return
    end
    if t.left || t.right
      temp = t.left ? t.left : t.right
      t.data = temp.data
      t.left, t.right = temp.left, temp.right
      return
    end
    parent = find_parent(t)
    if parent.left == t
      parent.left = nil
    else
      parent.right = nil
    end
  end

  def find_parent(t)
    return nil if @root == t
    node = @root
    while node.left != t && node.right != t
      if t.data < node.data
        node = node.left
      end
      node = node.right
    end
    node
  end

  def find_successor(t)
    successor = t.right
    if successor
      while successor.left
        successor = successor.left
      end
      return successor
    end
    begin
      if successor
        t = successor
      end
      successor = find_parent(t)
    end
    while successor && successor.right == t
      return successor
    end
  end

  private

  # recursive size
    def size_node(node)
      return 0 unless node
      return 1 +
        size_node(node.left) +
        size_node(node.right)
    end

  # iterative size
    def iterative_size
      return 0 unless @root
      count = 0
      q = [@root]
      until q.empty?
        front = q.pop
        count += 1
        q.push(front.left) if front.left
        q.push(front.right) if front.right
      end
      count
    end

  # recursive depth
    def depth_node(node)
      return 0 unless node
      return 1 +
        [depth_node(node.left), depth_node(node.right)].max
    end

  # itertive depth
    def iterative_depth
      # write this as practice
    end

    def insert_node(node, val)
      return TreeNode.new(val) unless node
      if val < node.data
        node.left = insert_node(node.left, val)
      else
        node.right = insert_node(node.right, val)
      end
      return node
    end

    def find_value_node(node, val)
      return node if !node || node.data == val
      if val < node.data
        return find_value_node(node.left, val)
      end
      return find_value_node(node.right, val)
    end

  # end private

end