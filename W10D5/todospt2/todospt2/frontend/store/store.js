import {createStore} from 'redux';
import rootReducer from '../reducers/root_reducer';
import applyMiddleware from 'redux';
import {thunkMiddleware} from '../middleware/thunk.js'



const store = createStore(rootReducer, null, applyMiddleware(thunkMiddleware)) //creates state! 
//createStore(reducer, [preloadedState], [enhancer] aka timetravel features)

export default store;