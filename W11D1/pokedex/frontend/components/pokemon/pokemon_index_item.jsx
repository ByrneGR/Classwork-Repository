import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = ({pokemon}) => {
    return (
        <div>
        <li><Link pokemon={pokemon} to={`/pokemon/${pokemon.id}`}>{pokemon.name}</Link></li>
            <img src={pokemon.image_url} />
        </div>
    )

}


export default PokemonIndexItem