def insertion_sort(arr)
  1.upto(arr.length - 1) do |i|
    val = arr[i]
    j = i - 1
    while j >= 0 and arr[j] > val
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = val
  end
  arr
end

arr = [3,9,4,7,2,0,11,5,22,-4,-1,]

puts insertion_sort(arr)