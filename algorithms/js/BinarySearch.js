'use strict';

function BinarySearch(arr, key){
  let lo = 0, hi = arr.length-1;
  while (lo <= hi){
    let mid = lo + Math.floor((hi - lo)/2);
    if ( arr[mid] > key ){
      hi = mid - 1;
    } else if ( arr[mid] < key ) {
      lo = mid + 1;
    } else {
      return mid;
    }
  }
  return -1;
};

function RecursiveBinarySearch(arr, key, lo, hi){
  if ( lo == undefined ) { lo = 0, hi = arr.length - 1 }
  if ( lo > hi ) { return -1; }
  let mid = lo + Math.floor( (hi-lo)/2 );
  if ( arr[mid] > key )
  { RecursiveBinarySearch(arr, key, lo, mid-1); }
  else if ( arr[mid] < key )
  { RecursiveBinarySearch(arr, key, mid+1, hi); }
  else { return mid; }
};

function LogarithmicBinarySearch(arr, key){
  let len = arr.length;
  if (len < 2) { return arr[0] == key ? 0 : -1 }
  let pow = 1;
  while (len >= 2) {
    len /= 2;
    pow += 1;
  }
  let lo = 0, hi = arr.length - 1, mid;
  for (let i=0; i<pow; i++){
    mid = lo + Math.floor((hi-lo)/2);
    if (arr[mid] > key)
    { hi = mid - 1; }
    else if (arr[mid] < key)
    { lo = mid + 1; }
    else { return mid; }
  }
  return -1;
};

module.exports = {
  BinarySearch,
  RecursiveBinarySearch,
  LogarithmicBinarySearch,
};
