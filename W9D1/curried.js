function curriedSum(numargs) {
  const args = [];
  return function _curriedAdd(num) {
    args.push(num);
    if (args.length === numargs) {
      console.log(args.reduce((acc, el) => {
      return acc + el;
      }));
    } else {
      return num
    }

  
  return _curriedAdd;
    }
}

Function.prototype.curry = function(numArgs) {
  let that = this;
  let args = [];
    return function (num) {
        args.push(num)
        if (args.length === numArgs) {
            that.apply(null, args);

        }
        
    }
}







Function.prototype.myBind2 = function (ctx, ...bindArgs) {
  return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
};

function curriedSum(numArgs) {
  const numbers = [];

  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      let total = 0;

      numbers.forEach((n) => { total += n; });

      return total;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

// using spread
Function.prototype.curry = function (numArgs) {
  const args = [];
  const that = this;

  function _curriedFn(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _curriedFn;
    }
  }

  return _curriedFn;
};

// using apply
Function.prototype.curry1 = function (numArgs) {
  const args = [];
  const fn = this;
  function _curriedFn(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(null, args);
    } else {
      return _curriedFn;
    }
  }
  return _curriedFn;
};

/**
 * With ES6 arrow functions
 * Notice we dont need to keep track of the `this` context (const fn = this).
 * An arrow function does not have its own `this`, 
 * the `this` value of the enclosing execution context is used.
 */
Function.prototype.curry2 = function (nArg) {
  const argArray = [];
  const _curriedFn = (arg) => {
    argArray.push(arg);
    if (argArray.length === nArg) {
      // spreading the array into individual arguments
      return this(...argArray); 
    } else {
      return _curriedFn;
    }
  };
  return _curriedFn;
};







