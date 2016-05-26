# def merge_sort(arr, low=nil, high=nil)
#   high, low = arr.length - 1, 0 if low.nil?
#   return if low >= high
#   mid = low + ((high - low) / 2)
#   merge_sort(arr, low, mid)
#   merge_sort(arr, mid + 1, high)
#   merge(arr, low, mid, high)
# end

# def merge(arr, low, mid, high)
#   low_arr = arr[low..mid]
#   high_arr = arr[mid+1..high]
#   idx = low
#   while !low_arr.empty? || !high_arr.empty?
#     if low_arr.empty? || high_arr.any? && high_arr[0] < low_arr[0]
#       arr[idx] = high_arr.shift()
#       idx += 1 and next
#     end
#     high_arr.empty? || high_arr[0] >= low_arr[0]
#     arr[idx] = low_arr.shift()
#     idx += 1
#   end
# end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])
  merge(left, right)
end

def merge(l, r)
  result = []
  until l.empty? || r.empty?
    result << (l.first < r.first ? l.shift : r.shift)
  end
  result + l + r
end

arr = (0..1000).to_a.shuffle

puts merge_sort(arr)
