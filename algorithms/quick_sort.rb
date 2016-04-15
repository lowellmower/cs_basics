def quick_sort(arr)
  return if arr.size < 2
  pivot = arr.size / 2
  sub_arr1 = arr[0..pivot]
  quick_sort(sub_arr1)
  arr[0..pivot] = sub_arr1

  sub_arr2 = arr[pivot...arr.size]
  quick_sort(sub_arr2)
  arr[pivot...arr.size] = sub_arr2
  arr
end