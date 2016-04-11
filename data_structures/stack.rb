# a stack is an abstract data type which provides
# last in first out (lifo) access to underlying data
# in comparison to a queue it is similar to reverse
# access and has two similar operations (push & pop)
# the implementtion below is built off our list class

require_relative 'node.rb'
require_relative 'linked_list.rb'

class Stack

  attr_accessor :list

  def initialize
    @list = List.new
  end

  def empty?
    @list.empty?
  end

  def push(data)
    @list.insert(data)
  end

  def pop
    raise RuntimeError.new('Stack empty') if self.empty?
    result = @list.head.data
    @list.head = @list.head.next
    result
  end

  def peek
    raise RuntimeError.new('Stack empty') if self.empty?
    @list.head.data
  end

end