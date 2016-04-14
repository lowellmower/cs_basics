def binary_search(arr, key)
  lower = 0
  upper = arr.size - 1
  while lower < upper # && arr[lower] != key <= this would return left most
    mid = lower + (upper - lower) / 2
    return mid if key == arr[mid]
    if key <= arr[mid]
      upper = mid
    else
      lower = mid + 1
    end
  end
  return lower
end