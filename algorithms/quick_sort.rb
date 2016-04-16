def quick_sort(arr)
  return arr if arr.length <= 1

  pivot_index = rand(arr.size)
  pivot_value = arr.delete_at(pivot_index)

  lesser = []
  greater = []

  arr.each { |x| x >= pivot_value ? greater << x : lesser << x}

  return quick_sort(lesser) + [pivot_value] + quick_sort(greater)

end

puts quick_sort([2,5,8,1,3,6])