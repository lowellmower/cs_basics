# A queue is an abstract data structure that prseerves
# first in first out (fifo) order of its data. The
# queue data structure has two basic opertions which
# are enqueue (push) and dequeue (pop) which should
# complete in constant time.
require_relative 'node.rb'

class Queue

  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def empty?
    @head.nil?
  end

  def push(data)
    if @tail
      @tail.next = Node.new(data)
      @tail = @tail.next
    else
      @head = @tail = Node.new(data)
    end
  end

  def pop
    raise RuntimeError.new('No items') if self.empty?
    result = @head.data
    @head = @head.next
    @tail = nil unless @head
    result
  end

end