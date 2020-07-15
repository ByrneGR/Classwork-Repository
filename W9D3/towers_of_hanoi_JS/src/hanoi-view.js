class View {
    constructor(game, $el){
        this.game = game;
        this.$el = $el;
        this.setupTowers();
        this.bindEvents();
    }

    bindEvents() {
        let that = this
        this.$el.on('click', 'li', event => {
          const $tower = $(event.currentTarget);
          
        })
    }

    setupTowers() {
        let $tower = null;
        let $disc = null;

        for (let tower = 0; tower < 3; tower++) {
            $tower = $("<ul>").addClass('tower').data('tower-id', tower);
            for (let disc = 0; disc < 3; disc++) {
                $disc = $("<li>").addClass('disc').data('disc-id', disc);
                $tower.append($disc);
            }
            this.$el.append($tower);
        }
    }

    render() {
      this.$el
    }
}

module.exports = View;


