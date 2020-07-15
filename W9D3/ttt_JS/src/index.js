const View = require('./ttt-view.js');
const Game = require('./game.js');

  window.View = View;


  $(() => {
    const game = new Game();
    const $grid = $('figure.ttt');
    new View(game, $grid);
  });

