# find the sub-array which if it's digits
# are summed result in the high value

class SubArray

  attr_accessor :start, :end, :sum

  def initialize
    @start = 0
    @end = 0
    @sum = 0
  end

  def set_bounds(list_start, list_end)
    @start, @end = list_start, list_end
  end

end

def max_sub_array(arr)
  max = SubArray.new
  cur = SubArray.new

  for i in 0...arr.size
    cur.sum = cur.sum + arr[i]
    if cur.sum > max.sum
      max.sum = cur.sum
      cur.set_bounds(cur.start, i)
      max.set_bounds(cur.start, i)
    elsif cur.sum < 0
      cur.sum = 0
      cur.set_bounds(i + 1, i + 1)
    end
  end
  arr.slice(max.start, max.end - max.start + 1)
end

p max_sub_array([-1, 2, 5, -1, 3, -2, 1])