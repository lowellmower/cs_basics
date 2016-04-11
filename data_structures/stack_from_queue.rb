require_relative 'queue.rb'

class StackFromQueue

  def initialize
    @q1 = Queue.new
    @q2 = Queue.new
  end

  def pop
    return @q1.pop unless @q1.empty?
    @q2.pop
  end

  def push(data)
    enq, deq = nil, nil
    @q1.empty? ? (enq, deq = @q1, @q2) : (enq, deq = @q2, @q1)
    enq.push(data)
    until deq.empty?
      enq.push(deq.pop)
    end
  end

end