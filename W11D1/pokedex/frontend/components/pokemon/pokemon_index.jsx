import React from 'react';
import PokemonIndexItem from './pokemon_index_item'
import { Link } from "react-router-dom";

class PokemonIndex extends React.Component {

    constructor(props) {
        super(props)
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {
        const pokemonItems = this.props.pokemon.map( (poke, idx) => {
            return (
              <div key={poke.id}>
              <PokemonIndexItem key={idx} pokemon={poke} />
              </div>
            )
        })

        return (
                <div>
                    <ul>{pokemonItems}</ul>
                </div>
        )
    }
}

export default PokemonIndex;