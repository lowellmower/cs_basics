'use strict';

var Merge = require('./MergeSort').MergeSort;
var BinarySearch = require('./BinarySearch').BinarySearch;
var Quick = require('./QuickSort').Quick;

let ASSIGNMENTS = [
  {name: 'MERGE SORT', done: true},
  {name: 'QUICK SORT', done: true},
  {name: 'HEAP SORT', done: true},
  {name: 'BINARY SEARCH', done: true},
  {name: 'BINARY SEARCH TREE', done: false},
  {name: 'RED BLACK TREE', done: false},
  {name: 'DEPTH FIRST SEARCH', done: false},
  {name: 'BREADTH FIRST SEARCH', done: false},
  {name: 'TREE FIND', done: false},
  {name: 'TREE INSERT', done: false},
];

function pad(a,b,c){//string/number,length=2,char=0
 return (new Array(b||2).join(c||0)+a).slice(-b)
}

ASSIGNMENTS.forEach((a) => {
  console.log(`${pad(a.name, 30, ' ')}: ${a.done ? 'x' : 'o'}`);
});
