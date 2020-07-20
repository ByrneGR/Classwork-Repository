import combineReducers from 'redux'
import entitiesReducer from './entities_reducer.js'

const rootReducer = (state = {}, action) => {
    return {
    entities: entitiesReducer(state.entities, action)
    };
};

export default rootReducer