'use strict';

class Quick{
  sort(arr, lo, hi){
    if (lo == undefined){
      lo = 0, hi = arr.length - 1;
      this.shuffle(arr);
    }
    if (lo >= hi ) { return; }
    let j = this.partition(arr, lo, hi);
    console.log('J', j);
    this.sort(arr, lo, j - 1);
    this.sort(arr, j + 1, hi);
  }
  shuffle(arr){
    let temp, idx;
    for (let i=0; i<arr.length; i++){
      temp = arr[i], idx = Math.floor(Math.random()*arr.length);
      arr[i] = arr[idx];
      arr[idx] = temp;
    }
  }
  exch(arr, i, j){
    let temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
  partition(arr, lo, hi){
    let i = lo, j = hi + 1, v = arr[lo];
    while (true) {
      while (arr[++i] < v){
        if (i == hi) {break;}
      }
      while (arr[--j] > v){
        if (j == lo) { break; }
      }
      if (i >= j){ break; }
      this.exch(arr, i, j);
    }
    this.exch(arr, j, lo);
    return j;
  }
};

class QuickSelect{

};

class Quick3Way{

};

module.exports = {
  Quick,
  QuickSelect,
  Quick3Way,
};
