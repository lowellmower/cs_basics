def quick_sort(arr)
  return arr if arr.length <= 1
  p = arr[0]
  less, more = arr[1..-1].partition {|x| x < p}
  quick_sort(less) + [p] + quick_sort(more)
end

puts quick_sort([2,5,8,1,3,6])
