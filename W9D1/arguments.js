// sum
// Write a sum
// function that takes any number of arguments:

// sum(1, 2, 3, 4) === 10;
// sum(1, 2, 3, 4, 5) === 15;
// Solve it first using the arguments keyword, then rewrite your solution to use the...rest operator.

function sum() {
//   let result = [];

//   for (let i = 0; i < arguments.length; i++) {
//       result.push(arguments[i]);
//   }
  
  // return result.reduce((acc, el) => acc + el);
let args = Array.prototype.slice.call(arguments)
  return args.reduce((acc, el) => acc + el);
}


function sum(...args) {
    console.log(args);
    return args.reduce((acc, el) => acc + el);
    
}


// The differences between arguments and Rest Parameters are:

// Rest Parameters only grab un - named arguments.
// Rest Parameters give us back a real array, so we can use methods like forEach, pop and sort.

// Function.prototype.myBind = function(ctx, ...args) {
//     let that = this;
    
//     return function (...args2) {
//             that.apply(ctx, args.concat(args2)); 
//     }
        
// }

Function.prototype.myBind = function (ctx) {
    let that = this;
    let args1 = Array.prototype.slice.call(arguments).slice(1)
    return function () {
        let args2 = Array.prototype.slice.call(arguments)
        that.apply(ctx, args1.concat(args2));
    }

}



class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

