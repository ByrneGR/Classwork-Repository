const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Gameview = require("./game_view.js")
const Game = require("./game.js");

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Gameview = Gameview;

document.addEventListener('DOMContentLoaded', () => {
  const canvasEl = document.getElementById('canvas');
  canvasEl.height = 500;
  canvasEl.width = 500;
  const ctx = canvasEl.getContext('2d');
  const gv = new Gameview(ctx);
  gv.start();
}
)


 
