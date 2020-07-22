import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON"
export const RECEIVE_ONE_POKEMON = "RECEIVE_ONE_POKEMON"

export const receiveAllPokemon = pokemon => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
})

// thunk action creator (asynch)
export const requestAllPokemon = () => (dispatch) => {
    // debugger
    return (
    APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon))))
}

// export const receiveOnePokemon = pokemon => ({
//     type: RECEIVE_ONE_POKEMON,
//     pokemon

// })

// export const requestOnePokemon = () => (dispatch) => {
//     return (
//         APIUtil.fetchOnePokemon()
//         .then(pokemon => dispatch(receiveOnePokemon(pokemon))))
// }

// export default receiveAllPokemon(pokemon);