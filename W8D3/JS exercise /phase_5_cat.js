function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  return this.name + " loves " + this.owner;
}

let a = new Cat("a","ownerA");
let b = new Cat("b","ownerB");
console.log(a.cuteStatement());
Cat.prototype.cuteStatement = function() {
    return "Everyone loves " + this.name;
  }
console.log(b.cuteStatement());

Cat.prototype.meow = function() {
    console.log(this.name + " meows!");
}

a.meow();

b.meow = function() {
    console.log("Alternative " + this.name + " meow!");
}

b.meow();
a.meow();