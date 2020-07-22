import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {

  Object.freeze(state);

  switch(action.type){
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    case RECEIVE_ONE_POKEMON:
      return action.pokemon;
    default: 
    return state;
    }
}

export default pokemonReducer;

// const laughsReducer = (state = {}, action) => {
//   debugger
//   Object.freeze(state);
//   switch (action.type) {
//     case ADD_LAUGH:
//       debugger
//       const newLaugh = action.laugh;
//       return Object.assign({}, state, {
//         [newLaugh.id]: newLaugh
//       });
//     case ADD_LAUGHS:
//       debugger
//       return action.laughs; // `action.laughs` is a POJO from the database
//     default:
//       return state;
//   }
// };