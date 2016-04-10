require_relative 'node.rb'

class CircularLinkedList

  include Enumerable

  attr_accessor :head

  def initialize
    @head = nil
  end

  def each
    item = @head
    while item
      yield item
      item = item.next
      break if item == @head
    end
  end

  def insert(data)
    new_node = Node.new(data)
    if !@head
      new_node.next = new_node
      @head = new_node
    else
      new_node.next = @head.next
      @head.next = new_node
      @head.data, new_node.data = new_node.data, @head.data
    end
  end

  def find_value(val)
    return find() do |item|
      item.data == val
    end
  end

  def remove(target)
    target = self.find_value(target)
    if !@head || @head == @head.next
      @head = nil
      return nil
    end
    next_node = target.next
    target.data = next_node.data
    target.next = next_node.next
    if @head == next_node
      @head = target
    end
  end

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