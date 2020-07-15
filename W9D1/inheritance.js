// Function.prototype.inherits = function(parent) {
//     function Surrogate() {}
//     Surrogate.prototype = parent.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// }

Function.prototype.inherits = function(parent) {
    this.prototype = Object.create(parent.prototype);
}

function MovingObject (name) {
    this.name = name;
};

MovingObject.prototype.moves = function () {
    console.log(this.name + " is moving.");
  
};




// function MovingObject() {}

function Ship(name) {
    MovingObject.call(this, name);
   
};
Ship.inherits(MovingObject); 


function Asteroid(name) {
    MovingObject.call(this, name);
    
    Asteroid.prototype.killsDinosaurs = function () {
        console.log(`${this.name} kills dinosaurs.`)
    }
};
Asteroid.inherits(MovingObject);