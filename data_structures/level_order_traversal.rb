require_relative 'queue.rb'

module LevelOrderTraversal

  def level_traversal(&visit)
    call_level_traversal(@root, &visit)
  end

  private

    def call_level_traversal(root, &visit)
      queue = Queue.new
      queue.push(root)
      until queue.empty?
        node = queue.pop
        queue.push(node.left) if node.left
        queue.push(node.right) if node.right
        yield node
      end
    end

# end private
end