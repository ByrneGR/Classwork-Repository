const readline = require("readline")
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout

});

const TEST = [4, 2, 1, 2, 5]


function addNumbers(sum = 0, numsLeft, completionCallback) {
  if (numsLeft > 0) reader.question("Please enter a number.", num => {
    let numInt = parseInt(num)
    sum += numInt
    console.log(sum)
    addNumbers(sum, numsLeft - 1, completionCallback);
  });
  else {
    completionCallback(sum)
  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));




// // Write this first.
// function askIfGreaterThan(el1, el2, callback) {
//   // Prompt user to tell us whether el1 > el2; pass true back to the
//   // callback if true; else false.
//   reader.question("Is " + el1 + " greater than " + el2 + "? (answer t or f)", result => {
//     if (result === "t") {
//       callback(true);
//     } else {
//       callback(false);
//     }
//   })
// }

// // Once you're done testing askIfGreaterThan with dummy arguments, write this.
// function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
//   // Do an "async loop":
//   // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
//   //    know whether any swap was made.
//   // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
//   //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
//   //    continue the inner loop. You'll want to increment i for the
//   //    next call, and possibly switch madeAnySwaps if you did swap.

//   if (i === arr.length - 1) {
//     outerBubbleSortLoop(madeAnySwaps);
//     return;
//   }
//   askIfGreaterThan(arr[i], arr[i + 1], isGreaterThan => {

//     if (isGreaterThan) {
//       [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]]
//       madeAnySwaps = true;
//     }

//     innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop)
//   })
// }

// // Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// // Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

// function absurdBubbleSort(arr, sortCompletionCallback) {
//   function outerBubbleSortLoop(madeAnySwaps) {
//     // Begin an inner loop if you made any swaps. Otherwise, call
//     // `sortCompletionCallback`.
//     if (madeAnySwaps) {
//       innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
//     } else {
//       sortCompletionCallback(arr)
//     }
//   }

//   // Kick the first outer loop off, starting `madeAnySwaps` as true.

//   //   madeAnySwaps = true;
//   outerBubbleSortLoop(true)
// }

// // console.log(innb(2, 1, 2 > 1 ))

// // console.log(innerBubbleSortLoop(TEST, 0, true, console.log("In outer bubble sort")))

// // absurdBubbleSort(TEST, function(arr) {
// //   console.log("Sorted array: " + JSON.stringify(arr));
// //   reader.close();
// // });

// Function.prototype.myBind = function (context) {
//   return () => this.apply(context)
// }

// class Lamp {
//   constructor() {
//     this.name = "a lamp";
//   }
// }

// const turnOn = function () {
//   console.log("Turning on " + this.name);
// };

// const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

// const boundTurnOn = turnOn.bind(lamp);
// const myBoundTurnOn = turnOn.myBind(lamp);

// boundTurnOn(); // should say "Turning on a lamp"
// myBoundTurnOn(); // should say "Turning on a lamp"

// Function.prototype.myThrottle = function (interval) {
//   let tooSoon = false;
//   return (...args) => {
//     if (!tooSoon) {
//       tooSoon = true;
//       setTimeout(() =>
//         tooSoon = false, interval);
//       this(...args);
//     }
//   }
// }

Function.prototype.myThrottle = function (interval) {
    // declare a variable outside of the returned function
    let tooSoon = false;
    return (...args) => {
        // the function only gets invoked if tooSoon is false
        // it sets tooSoon to true, and uses setTimeout to set it back to
        // false after interval ms
        // any invocation within this interval will skip the if 
        // statement and do nothing
        if (!tooSoon) {
            tooSoon = true;
            setTimeout(() => tooSoon = false, interval);
            this(...args);
        }
    }
}


class Neuron {
  fire() {
    console.log("Firing!");
  }
}

const neuron = new Neuron();
// When we create a new Neuron,
// we can call #fire as frequently as we want

// The following code will try to #fire the neuron every 10ms. Try it in the console:
const interval = setInterval(() => {
  neuron.fire();
}, 10);

// You can use clearInterval to stop the firing:
clearInterval(interval);

// Using Function#myThrottle, we should be able to throttle
// the #fire function of our neuron so that it can only fire
// once every 500ms:

neuron.fire = neuron.fire.myThrottle(500);

const interval = setInterval(() => {
    neuron.fire();
}, 10);

// This time, if our Function#myThrottle worked correctly,
// the Neuron#fire function should only be able to execute
// every 500ms, even though we're still trying to invoke it
// every 10ms!

// If we want this behavior for ALL neurons, we can do the same logic in the constructor:

class Neuron {
    constructor() {
        this.fire = this.fire.myThrottle(500);
    }

    fire() {
        console.log("Firing!");
    }
}