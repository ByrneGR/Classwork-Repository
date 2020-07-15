import React from 'react';
import Tile from './tile'


class Board extends React.Component {

    constructor (props) {
        super(props);
        // this.grid = Array.from(this.props.board.grid);
        this.grid = this.props.board.grid;
    }

    render () {
        const board = this.grid.map((row, idx1) => {
            const rowMap = row.map((ele, idx2) => {
                // debugger
                return (
                    <Tile tile={ele} updateGame={this.props.updateGame} key={idx1 + ' , ' + idx2}/> 
                )
            });
            return (
                <div className="row" key={idx1}> {rowMap} </div>
            );
        });
        // debugger
        return (
            <div>
                <h1>board test</h1>
                <div className="board">{board}</div>
            </div>
        )
    }
}
export default Board;

// const numbers = [1, 2, 3, 4, 5];
// const listItems = numbers.map((number) =>
//     <li key={number.toString()}>
//         {number}
//     </li>
// );

// https://reactjs.org/docs/lists-and-keys.html#keys