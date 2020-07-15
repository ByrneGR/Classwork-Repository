const Game = require("./game.js");

function Gameview(ctx) {
    this.game = new Game();
    this.ctx = ctx 
}


Gameview.prototype.start = function() {
  let callback = function () {
    this.game.moveObjects();
    this.game.draw(this.ctx);
  };
    setInterval(callback.bind(this), 20)
};



module.exports = Gameview;