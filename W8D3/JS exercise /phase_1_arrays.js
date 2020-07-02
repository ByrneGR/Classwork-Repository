Array.prototype.uniq = function() {
  let unique_arr = [];

//Method: 1
  this.forEach((ele)=>{
    if (!unique_arr.includes(ele)) {
      unique_arr.push(ele);
    }
  });

//Method 2
    // for (let ele in this) {
    //     if (!unique_arr.includes(ele)) {
    //         unique_arr.push(ele);
    //     }
    // }

//Method 3
    // for (let i=0; i < this.length; i++) {
    //         if (!unique_arr.includes(this[i])) {
    //             unique_arr.push(this[i]);
    //         }
    //     }

  return unique_arr;

//   for (let i = 0; i < this.length; i++) {
//     if this[i] 
//   } 
}

// Array.prototype.func = () => {
//     // ruby: self = nothing = this
// }
// [a,b,c].func() // nil/undefined.func()

// const array = [1, 1, 1, 2, 2, 2, 3, 3, 3]
// console.log(array.uniq())
// console.log([1,1,1,2,2,2,3,3,3].uniq());
// function() {

// }

// ()->{

// }

Array.prototype.twoSum = function() {
    let twoSumArr = [];

    this.forEach((ele1, idx1) => {
        // this.forEach((ele2, idx2) => {
        //     if (idx1 != idx2 && ele1 + ele2 === 0) {
        //         twoSumArr.push([idx1, idx2]);
        //     }
        // })
        for (let idx2 = idx1 + 1; idx2 < this.length; idx2++){
            let ele2 = this[idx2];
            if (idx1 != idx2 && ele1 + ele2 === 0) {
                twoSumArr.push([idx1, idx2]);
            }
        }
    })

    return twoSumArr;
}

// const arr = [-3,-1,0,1,2,3];
// console.log(arr.twoSum());



Array.prototype.transpose = function() {

//   let arr = [];
    let arr = this;
    // for (let i = 0; i < this.length; i++){
    //     arr.push(Array(this[i].length))
    // }
  
  let r = 0;
  while (r < this.length) {
    let c = 0;
    while (c < this[r].length) {
        
      let old = this[r][c];
      arr[r][c] = this[c][r];
      arr[c][r] = old;
    
      c++;
    }
    r++;    
  }
  

  return arr;
}


// var b = list[y];
// list[y] = list[x];
// list[x] = b;


console.log( [[1, 2], ["a", "b"]].transpose());

// 1,2,3
// 4,5,6

// a[0][0], a[1][0]
// a[0][1], a[1][1]
// a[0][n]

// 1,4
// 2,5
// 3,6

//