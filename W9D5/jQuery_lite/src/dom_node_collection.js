class DomNodeCollection {
  constructor(elements) {
    this.elements = elements;
  }

  html(str) {
    if (!str) {
      return this.elements[0].innerHTML;
    } else {
      this.elements.forEach( function (el) {
        el.innerHTML = str;
      });
    }
  }

  empty() {
    this.elements.forEach(function (el) {
      el.innerHTML = "";
    });
  }

  // append(arg) {
  //   if (typeof arg === "string") {
  //     this.elements.forEach(function (el) {
  //       el.innerHTML += arg;
  //     }) else if (arg instanceof HTMLElement) {
  //       this.elements.forEach(function (el) {
  //        el.innerHTML += arg.outerHTML }
  //     })
  //   }
  // }

  append(arg) {
    if (typeof arg === "string") {
      this.elements.forEach(function (el) {
        el.innerHTML += arg;
      });
    } else if (arg instanceof HTMLElement) {
      this.elements.forEach(function (el) {
        el.innerHTML += arg.innerHTML;
      })
    }
  }
  
  attr(arg1, arg2) {
    if (typeof arg2 === "undefined") {
      return this.elements[0].getAttribute(arg1);
    } else {
      this.elements[0].setAttribute(arg1, arg2);
      return this.elements;
    }
  }
  // pass in 2nd argument for setter
  //if 2nd argument is undefined, then it's just a getter

  addClass(arg) {
    this.elements[0].className = arg
  }

  removeClass(arg) {
    if (typeof arg === "undefined") {
      this.elements.forEach(function (el) {
        el.className = "";
      })
    } else if (arg instanceof Array) {
      this.elements.forEach(function (el) {
        if (arg.includes(el.className)) el.className = "";
      });
    } else {
      this.elements.forEach(function (el) {
      
        if (el.className.includes(arg)) 
        // debugger
        el.className = el.className.replace(arg, "");
    
      })
    }
  }
}

module.exports = DomNodeCollection;