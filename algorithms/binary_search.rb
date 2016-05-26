def binary_search_it(arr, key)
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

def binary_search_rec(arr, val, lo=0, hi=arr.length-1)
  return -1 if lo > hi
  mid = lo + (hi - lo) / 2
  return mid if arr[mid] == val
  if mid > val
    hi = mid - 1
  else
    lo = mid + 1
  end
  binary_search_rec(arr, val, lo, hi)
end

arr = [2,5,7,8,9,10]
puts binary_search_rec(arr, 7)