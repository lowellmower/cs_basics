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

function SelectionMergeSort(arr, lo, hi){
  if (lo == undefined) { lo = 0, hi = arr.length - 1; }
  if (lo >= hi) { return; }
  let mid = lo + Math.floor((hi-lo)/2);
  SelectionMergeSort(arr, lo, mid);
  SelectionMergeSort(arr, mid+1, hi);
  SelectionMerge(arr, lo, mid, hi);
};

function SelectionMerge(arr, lo, mid, hi){
  if (arr.slice(lo, hi+1).length >= 4){
    Merge(arr, lo, mid, hi);
  } else {
    for (let i=lo; i<hi+1; i++){
      for (let j=i; j>0 && arr[j] < arr[j-1]; j--){
        let temp = arr[j];
        arr[j] = arr[j-1];
        arr[j-1] = temp;
      }
    }
  }
};

module.exports = {
  MergeSort,
  SelectionMergeSort,
};
