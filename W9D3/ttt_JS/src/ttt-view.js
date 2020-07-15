class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    let that = this
    this.$el.on('click', 'li', event => {
      const $box = $(event.currentTarget);
      console.log($box.data('pos-data'))
      // that.game.playMove($box.data('pos-data'))
      that.makeMove($box)
    })
  }


  makeMove($box) {
    const pos = $box.data('pos-data')
    const currentPlayer = this.game.currentPlayer
    $box.addClass(`${currentPlayer} white-cell`);
    this.game.playMove(pos)
    
    if (this.game.winner()) {
      alert(`Congratulations ${this.game.currentPlayer}`)
    }
    
  }
  

  setupBoard() {
    let $grid = $('<ul>');
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        const $li = $('<li>');
        $li.data('pos-data', [row, col])
        $grid.append($li);
    }
  }
    this.$el.append($grid);
  }

}


module.exports = View;
