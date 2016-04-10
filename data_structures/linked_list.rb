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

  # **** MODIFICATIONS ****

  def remove_values(val)
    while @head && @head.data == val
      @head = @head.next
    end
    index = @head
    while index
      while index.next && index.next.data == val
        index.next = index.next.next
      end
      index = index.next
    end
  end

  def reverse
    prev = nil
    head = @head
    while head
      head.next, prev, head = prev, head, head.next
    end
    @head = prev
  end

  # non-sorted merge
  def merge(list)
    h1 = @head
    h2 = list.head
    if !h1 || !h2
      @head = h1 ? h1 : h2
      return
    end
    while h1.next
      h1 = h1.next
    end
    h1.next = h2
  end

  # write a method which checks if a list
  # is a palindrome
  def is_palindrome?
    s = []
    self.each { |n| s.push n }
    self.each { |n| return false if n.data != s.pop.data}
    true
  end

  # write a method which determines if there
  # is a looping node, i.e. that there is a
  # collision if using a hash table

  # we can do this without the allocation of
  # new memory to a hash table nor worry about
  # dynamically resizing
  def detect_loop
    return false if !@head
    leading = @head
    trailing = @head
    while leading
      leading = leading.next
      return true if leading == trailing
      trailing = trailing.next
      leading = leading.next if leading
    end
    false
  end

end
