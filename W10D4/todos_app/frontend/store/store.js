import {createStore} from 'redux';
import rootReducer from '../reducers/root_reducer';



const store = createStore(rootReducer) //creates state! 
//createStore(reducer, [preloadedState], [enhancer] aka timetravel features)

export default store;