'use strict';

function MergeSort(arr, lo, hi){
  if (lo == undefined) { lo = 0, hi = arr.length - 1; }
  if (lo >= hi){ return; }
  let mid = lo + Math.floor( ( hi - lo ) / 2 );
  MergeSort(arr, lo, mid);
  MergeSort(arr, mid + 1, hi);
  Merge(arr, lo, mid, hi);
};

function Merge(arr, lo, mid, hi){
  let arr1 = arr.slice(lo, mid + 1);
  let arr2 = arr.slice(mid + 1, hi + 1);
  let idx = lo;
  while (arr1.length || arr2.length){
    if (arr2[0] < arr1[0] || ! arr1.length ) {
      arr[idx++] = arr2.shift();
    } else {
      arr[idx++] = arr1.shift();
    }
  }
};

module.exports = {
  MergeSort,
};
