const DomNodeCollection = require('./dom_node_collection')

function $l (arg) {
  if (typeof arg === "string") {
    const nodes = document.querySelectorAll(arg)
    array = Array.prototype.slice.call(nodes)
    return new DomNodeCollection(array);
  } else if (arg instanceof HTMLElement) {
    return new DomNodeCollection([arg])
  }
  
}

window.$l = $l;



// create new instance of DOM node collection using array of nodes as an arg