Array.prototype.bubbleSort = function() {
    this.forEach((el1,idx1)=>{
        this.forEach((el2, idx2)=>{
            if (idx2 > idx1 && el2 < el1) {
                let old = this[idx1];
                this[idx1] = this[idx2];
                this[idx2] = old;
            }
        })
    })

    return this;
}
// 
// console.log([5,4,3,2,1].bubbleSort());
String.prototype.substrings = function() {
  let subs = [];

  for (let i = 0; i < this.length; i++) {
    let subStr = this[i];
      subs.push(subStr);
    for (let j = i+1; j < this.length; j++) {
      subStr += this[j];
      subs.push(subStr);
    }
  }
  return subs;
} 

console.log("hello".substrings());