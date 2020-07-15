import React from 'react';
import Board from './board';
import * as Minesweeper from '../minesweeper.js'
// import Tile from './tile';

// import { Board, Tile } from '../minesweeper' 
// { } if we have more than one export ie) Tile & Board. Must be exact match
// no need for {} if we do default export since default export only exports one thing being exported


class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = {board: new Minesweeper.Board(5, 6)};
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame () {
 
    }

    render () {
        return (
          <div>
            <h1>Minesweeper</h1>
                <Board board = {this.state.board} updateGame = {this.updateGame} />
          </div>
        )

    }
}

export default Game;