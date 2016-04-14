'use strict';


class Heap{
  sort(arr){
    arr.unshift(null);
    let N = arr.length - 1;
    for (let k=Math.floor(N/2); k>=1; k--){
      this.sink(arr, k, N);
    }
    while (N > 1 )
    {
      this.exch(arr, 1, N--);
      this.sink(arr, 1, N);
    }
    arr.shift();
  }
  exch(arr, i, j){
    let temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
  swim(arr, k){
    while (k > 1 && arr[Math.floor(k/2)] < arr[k]) {
     this.exch(arr, Math.floor(k/2), k);
     k /= 2;
    }
  }
  sink(arr, k, N){
    while (2*k <= N){
      let j = 2*k;
      if (j < N && arr[j] < arr[j+1]) { j++; }
      if (arr[k] >= arr[j]) { break; }
      this.exch(arr, k, j);
      k = j;
    }
  }
};

module.exports = {
  Heap,
};
