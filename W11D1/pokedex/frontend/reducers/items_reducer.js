import {RECEIVE_ONE_POKEMON} from '../actions/pokemon_actions'


const itemsReducer = (state = {}, action) => {
    Object.freeze(state);

    switch(action.type) {
        case RECEIVE_ONE_POKEMON:
            return action.pokemon.items;
        default:
        return state;
    }
}

export default itemsReducer;