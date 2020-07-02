// const range = (start, end) => {
//     let arr = [start];

//     if (arr.length == 1) { return arr }

//     return range(end) + range(end-1)
// }

const range = (start, end) => {
    if (start >= end) { return []; }
    return [start].concat(range(start + 1, end));
}

// console.log(typeof(range(1,5)));
// console.log(range(1,5));

const sumRec = (arr) => {
  if (arr.length === 1) { return arr[0];}
    return arr[0] + sumRec(arr.slice(1));
}

// console.log(sumRec([1,2,3,5]));

const exponent = function(base, exp) {
    if (exp === 0) { return 1; }
    if (exp === 1) { return base; }
    return exponent(base, exp - 1) * base;
}

// console.log(exponent(3, 5));

const fibonacci = function(num) {
    if (num <= 1) { return [1]; }
    if (num === 2) { return [1, 1]}
    let lastFibArr = fibonacci(num-1);
    let lastIdx = lastFibArr.length - 1
    let lastFib = lastFibArr[lastIdx];
    return lastFibArr.concat([lastFib + lastFibArr[lastIdx-1]])
}

// console.log(fibonacci(8));

const deepdup = (arr) => {
    let res = [];
    arr.forEach((el)=>{
        if (Array.isArray(el)) {
            res.push(deepdup(el));
        } else {
            res.push(el);
        }
    });
    return res;
}

let arr = [[3],1,[2,[3,5,5,[8],5]]];
let arr2 = deepdup(arr);
console.log(arr);
console.log(arr2)

arr2[0][0] = 100;
arr2[2][0] = 200;
arr2[2][1][3] = 300;

console.log(arr);
console.log(arr2);

Array.isArray([1, 2, 3]);  // true