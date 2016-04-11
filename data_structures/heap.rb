# a heap is an abstract data structure similar to that of
# a binary search tree. Like a BST, a heap is a collection
# of nodes that have a data member value and at most, two
# child nodes. The differentiating factor is that nodes in
# a heap satisfy the heap property:
# e.g. when p.value >= n.value for each child node n of a
# parent p - - this example would be considered a max heap
# EXAMPLE:
#        5
#       / \
#      4   3
# a min heap would be a heap where in a parent p never
# exceeds the values of a child node n. This would be
# known as a min heap
# EXAMPLE:
#          3
#        /   \
#       10    4
#      / \   / \
#     13 11 5   8
# note that the root in a min heap has the smallest value
# in the data structure and the root in a max heap is the
# opposite, e.g. the larget value in the data structure
# for further reading, look into Brodal heap, Fibonacci heap
# and the differences between them and binary heap (below)

# when creating a heap from a vector, the root will always
# be index zero and we will calculate the child nodes as
# the left child being 2 * i + 1 where i is the index and
# the right child node as 2 * i + 2 where i is the index

class Heap

  attr_accessor :arr

  def initialize(array, compare = nil)
    @compare = compare
    @arr = array
    @arr.each_with_index do |idx|
      parent = parent_index(idx)
      until (idx == parent || compare(parent, idx))
        @arr[parent], @arr[idx] = @arr[idx], @arr[parent]
        idx = parent
        parent = parent_index(idx)
      end
    end
  end

  def parent_index(idx)
    idx != 0 ? (idx - 1) / 2 : 0
  end

  def left_child_index(idx)
    return idx * 2 + 1
  end

  def right_child_index(idx)
    return idx * 2 + 2
  end

  def insert(data)

  end

  def find_max

  end

  def remove_max

  end

  def increase_key

  end

  private

    def compare(lhs, rhs)
      unless @compare
        return @arr[lhs] >= @arr[rhs]
      end
      return @compare.call(@arr[lhs], @arr[rhs])
    end
# end private
end