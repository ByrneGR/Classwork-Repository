import React from 'react'
import ReactDOM from 'react-dom'
import { receiveOnePokemon, requestOnePokemon } from './actions/pokemon_actions'
import { fetchAllPokemon } from './util/api_util'
import configureStore from './store/store'
import { selectAllPokemon} from './reducers/selectors'
import Root from './components/root'
import { HashRouter, Route } from "react-router-dom";


// /window.receiveOnePokemon = store.receiveOnePokemon;


document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore({});
    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);
    
    window.getState = store.getState;
    window.dispatch = store.dispatch;
});