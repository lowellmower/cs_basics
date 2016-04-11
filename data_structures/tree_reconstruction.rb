module TreeReconstruct

  # in-order traversal
  # see notes in private
  def inorder(&visit)
    inorder_node(@root, &visit)
  end

  # post-order traversal
  def postorder(&visit)
    postorder_node(@root, &visit)
  end

  # pre-order traversal
  def preorder(&visit)
    preoder_node(@root, &visit)
  end

  private

  # guarentee data in BST will be visited in
  # their sorted order. First we recurse left,
  # visiting the current node, then recurse
  # right.
    def inorder_node(node, &visit)
      return unless node
      inorder_node(node.left, &visit)
      yield node
      inorder_node(node.right, &visit)
    end

  # post order traversal evaluates the current
  # node only after visiting both children
    def postorder_node(node, &visit)
      return unless node
      postorder_node(node.left, &visit)
      postorder_node(node.right, &visit)
      yield node
    end

  # pre order traversal evaluates a current node's
  # data value prior to visiting either children
    def preoder_node(node, &visit)
      return unless node
      yield node
      preoder_node(node.left, &visit)
      preoder_node(node.right, &visit)
    end

  # note that with all traversals, the ony code changed
  # is where we yield to the visited node. This allows
  # for control logic to be inserted before/after
  # child node visits

# end private
end