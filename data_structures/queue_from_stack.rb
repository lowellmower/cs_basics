require_relative 'stack.rb'

class QueueFromStack

  def initialize
    @instack = Stack.new
    @outstack = Stack.new
  end

  def empty?
    @instack.empty?
  end

  def push(data)
    @instack.push(data)
  end

  def pop
    transfer
    return @outstack.pop
  end

  private

    def transfer
      until @instack.empty?
        @outstack.push(@instack.pop)
      end
    end
# end private
end