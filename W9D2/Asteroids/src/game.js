const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");


function Game() {
    this.asteroids = []
    this.addAsteroids(Game.NUM_ASTEROIDS)
    // this.asteroids.push(new Asteroid({pos: this.randomPosition(), color: 'blue', game: this})
}
Game.DIM_X = 500;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 20; 

Game.prototype.addAsteroids = function(num) {
    for (let i = 0; i < num; i++) {
        this.asteroids.push(new Asteroid({pos: this.randomPosition(), game: this}))
    };
}

Game.prototype.randomPosition = function() {
    let x = Math.random() * Game.DIM_X;
    let y = Math.random() * Game.DIM_Y
    return [x, y];
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y)
    this.asteroids.forEach (asteroid => {
      asteroid.draw(ctx);
    })
}

Game.prototype.moveObjects = function() {
  // debugger
    this.asteroids.forEach(asteroid => {
        // debugger;
        asteroid.move();
    })
}

Game.prototype.wrap = function(pos) {
    if (pos[0] > 500) {
      pos[0] -= 500
    }
    else if (pos[1] > 500) {
      pos[1] -= 500
    }
    if (pos[0] < 0) {
      pos[0] += 500
    }
    else if (pos[1] < 0) {
      pos[1] += 500
    }

}


module.exports = Game;