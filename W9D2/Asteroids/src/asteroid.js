const Fnc = require("./utils.js");
const MovingObject = require("./moving_object.js")

function Asteroid(options) {
    // this.pos = pos;
    options.color = 'red';
    options.radius = 20;
    options.vel = Fnc.randomVec(1)
    MovingObject.call(this, options)
};

Fnc.inherits(Asteroid, MovingObject);

module.exports = Asteroid;