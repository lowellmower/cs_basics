# A binary search tree (BST) or "ordered binary tree" is a type of binary tree
# where the nodes are arranged in order: for each node, all elements in its
# left subtree are less to the node (<), and all the elements in its right
# subtree are greater than the node (>)

# Binary Tree:    BST:
#   1                 2
#  / \               / \
# 2   3             1   3

require_relative 'tree_node.rb'
require_relative 'tree_traversal.rb'

class BinarySearchTree

  include TreeTraversal

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

  def balanced?
    return balanced_depth(@root)[0]
  end

  def find_path(t)
    t = self.find(t)
    path = []
    node = @root
    while node && path.empty? || path[-1] != t
      path << node
      if t.data < node.data
        node = node.left
      else
        node = node.right
      end
    end
    return !t || path[-1] == t, path
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

  # iterative size - breadth first
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

  # itertive depth - depth first
    def iterative_depth
      # write this as practice
    end

  # find if tree is balanced
    def balanced_depth(node)
      return [true, 0] unless node
      balanced, left = balanced_depth(node.left)
      return [false] unless balanced
      balanced, right = balanced_depth(node.right)
      return [false] unless balanced
      depth = 1 + [left, right].max
      return ((left - right).abs <= 1), depth
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