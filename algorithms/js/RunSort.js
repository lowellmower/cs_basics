/*
 * INSTRUCTIONS
 * node RunSearch.js [size] [repetitions] [BinarySearch] [RecursiveBinarySearch] [LogarithmicBinarySearch]
 */

'use strict';

let BinarySearch = require('./BinarySearch').BinarySearch;
let RecursiveBinarySearch = require('./BinarySearch').RecursiveBinarySearch;
let LogarithmicBinarySearch = require('./BinarySearch').LogarithmicBinarySearch;
let MergeSort = require('./MergeSort').MergeSort;
let SelectionMergeSort = require('./MergeSort').SelectionMergeSort;

class RunSearch{
  constructor(T, N, type) {
    this.T = T;
    this.N = N;
    this.type = type;
    this.results = [];
    this.hi = null;
    this.lo = null;
    this.acc = { counts: 0, percentage: 0 };
  }
  run(){
    let T = this.T, N = this.N, type = this.type;
    for (let i=0; i<T; i++){
      this.sort();
    }
    let avg = this.results.reduce(function(prev, next) { return prev + next }) / this.results.length;
    let acc = this.acc.percentage;
    return {
      avg: avg,
      acc: acc
    };
  }
  getScore(rank, arr){
    return arr[rank] == rank;
  }
  sort(){
    let arr = new Array(this.N).fill(0).map((v,i) => i);
    let key = Math.floor(Math.random()*this.N);
    let d1 = new Date().valueOf();
    let rank;
    switch(this.type){
      case 'BinarySearch':
        rank = BinarySearch(arr, key);
      case 'RecursiveBinarySearch':
        rank = RecursiveBinarySearch(arr, key);
      case 'LogarithmicBinarySearch':
        rank = LogarithmicBinarySearch(arr, key);
      case 'MergeSort':
        rank = MergeSort(arr);
      case 'SelectionMergeSort':
        rank = SelectionMergeSort(arr);
      default:
        rank = BinarySearch(arr, key);
    }
    let d2 = new Date().valueOf();
    this.results.push(d2-d1);
    let prev = this.acc.counts * this.acc.percentage;
    let score = this.getScore(rank, arr) ? 1 : 0;
    let acc = (prev + score) / (this.acc.counts + 1);
    this.acc = { counts: this.acc.counts + 1, percentage: acc };
  }
};


let type1 = process.argv[4];
let type2 = process.argv[5];
let type3 = process.argv[6];
let T = parseInt(process.argv[2]);
let N = parseInt(process.argv[3]);

console.log('ARGV type1, type2, T, N: ', type1, type2, T, N);
let runner1 = new RunSearch(T, N, type1);
let runner2 = new RunSearch(T, N, type2);

let result1 = runner1.run();
let result2 = runner2.run();

console.log(`for size ${N} and times ${T}\n`);
console.log(`${type1} had accuracy ${result1.acc} and average speed ${result1.avg}`);
console.log(`${type2} had accuracy ${result2.acc} and average speed ${result2.avg}`);
/*
 * ARGV type1, type2, T, N:  BinarySearch RecursiveBinarySearch 10000 10000
 * for size 10000 and times 10000
 *
 * BinarySearch had accuracy 1 and average speed 0.0025
 * RecursiveBinarySearch had accuracy 1 and average speed 0.0036
 * LogarithmicBinarySearch had accuracy 1 and average speed 0.0022
 * */

