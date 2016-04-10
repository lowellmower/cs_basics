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

  end

  private

    def insert_node(node, val)
      return TreeNode.new unless node
      if val < node.data
        node.left = insert_node(node.left, val)
      else
        node.right = insert_node(node.right, val)
      end
      return node
    end

  # end private

end