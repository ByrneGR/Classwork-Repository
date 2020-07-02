Array.prototype.myEach = function(callback) {
    // this.forEach((el)=>{callback(el)});
}

  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
// const cb = function(el) {
//     console.log(100+el)
// };
// [1,2,3].myEach(cb);

Array.prototype.myMap = function(callback) {
    let mapped = [];
    this.forEach((el)=>{ mapped.push(callback(el)) });
    return mapped;
}

// const cb = (el) => (el * 10);
// console.log([1,2,3].myMap(cb));

Array.prototype.myReduce = function(callback, initialValue=null) {
    let acc = initialValue ? initialValue : 0;
      this.forEach((el, idx)=>{
        acc = callback(acc, el);
      });
    return acc;
}

console.log([1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  })); // => 6)

console.log([1, 2, 3].myReduce(function(acc, el) {
    return acc + el;
  }, 25)); // => 31

