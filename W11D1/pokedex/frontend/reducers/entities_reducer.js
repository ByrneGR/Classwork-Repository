import pokemonReducer from './pokemon_reducer.js'
import {combineReducers} from 'redux'

// debugger
const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
})

// const entitiesReducer = (state = {}, action) => {
//   // debugger
//   return {
//     pokemon: pokemonReducer(state.pokemon, action)
//   };
// };


export default entitiesReducer;


// const entitiesReducer = (state = {}, action) => {
//   debugger
//   return {
//     laughs: laughsReducer(state.laughs, action),
//     users: usersReducer(state.users, action)
//   };
// };