require_relative 'node.rb'

class List

  attr_accessor :head

  def initialize
    @head = nil
  end

  def each
    item = @head
    while item
      yield item
      item = item.next
    end
  end

  # normal insert into non-sorted list
  def insert(data)
    @head = Node.new(data, @head)
  end

  # insert into a sorted list
  def insert_sorted(data)
    return insert(data) if !@head || data <= @head.data
    current = @head
    while current.next && current.next.data < data
      current = current.next
    end
    current.next = Node.new(data, current.next)
  end

  # because random access is not supported, the only traversal
  # supported considers each node in turn
  def find(val)
    self.each {|n| return n if n.data == val }
  end

  def remove(target)
    prev = nil
    return @head = @head.next if @head.data == target
    self.each do |n|
      if n.next.data == target
        prev = n and break
      end
    end
    prev.next = prev.next.next if prev
  end

  # **** SELECTION ****

  def mid_point
    trailing = @head
    index = @head
    while index
      index = index.next
      if index
        index = index.next
        trailing = trailing.next
      end
    end
    trailing
  end

  def num_from_end(n)
    index = @head
    trailing = @head
    n.times do
      index = index.next if index
    end
    while index && index.next
      index = index.next
      trailing = trailing.next
    end
    trailing
  end

end
