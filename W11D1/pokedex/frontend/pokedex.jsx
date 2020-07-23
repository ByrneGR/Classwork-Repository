import React from 'react'
import ReactDOM from 'react-dom'
import { receiveOnePokemon, requestOnePokemon, receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions'
import { fetchAllPokemon, fetchOnePokemon } from './util/api_util'
import configureStore from './store/store'
import { selectAllPokemon} from './reducers/selectors'
import Root from './components/root'
import { HashRouter, Route } from "react-router-dom";


window.receiveOnePokemon = receiveOnePokemon;
window.requestOnePokemon = requestOnePokemon;
window.receiveAllPokemon = receiveAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.fetchOnePokemon = fetchOnePokemon;


document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore({});
    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);
    
    window.getState = store.getState;
    window.dispatch = store.dispatch;
});