def merge_sort(arr, low=nil, high=nil)
  high, low = arr.length - 1, 0 if low.nil?
  return if low >= high
  mid = low + ((high - low) / 2)
  merge_sort(arr, low, mid)
  merge_sort(arr, mid + 1, high)
  merge(arr, low, mid, high)
end

def merge(arr, low, mid, high)
  low_arr = arr[low..mid]
  high_arr = arr[mid+1..high]
  idx = low
  while !low_arr.empty? || !high_arr.empty?
    if low_arr.empty? || high_arr.any? && high_arr[0] < low_arr[0]
      arr[idx] = high_arr.shift()
      idx += 1
      next
    end
    high_arr.empty? || high_arr[0] >= low_arr[0]
    arr[idx] = low_arr.shift()
    idx += 1
  end
end

arr = (0..1000).to_a.shuffle

puts arr.to_s

merge_sort(arr)

puts arr.to_s