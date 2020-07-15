import React from 'react';
import * as Minesweeper from '../minesweeper.js';

class Tile extends React.Component {
    constructor (props) {
        super(props);
        // this.tile = new Minesweeper.Tile(this.props.tile.board, this.props.tile.pos)
        this.tile = this.props.tile;
        // console.log(this.Minesweeper.explored())
        this.state = {explored: false}
        // this.explored = this.tile.tileMS.explored();

        this.handleClick = this.handleClick.bind(this);
    }
    handleClick () {
        // debugger
        this.setState({explored: true})
    }
    render () {

        if (this.tile.explored || this.tile.adjacentBombCount() > 1) {
            return (
                <div className="tile">{this.tile.adjacentBombCount()}</div>
            )
        }
            else if (this.tile.bombed) {
            // debugger
            return (
                <div className="tile">&#128163;</div>
            )
        } else {
      
        return  (
                <div className="tile" onClick={() => { this.handleClick() }}>@</div>
            )
            }
        }
    } 

export default Tile;