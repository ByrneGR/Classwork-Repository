import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store.js';
import { receiveTodos, receiveTodo} from './actions/todo_actions'
import App from './components/app.jsx';
import Root from './components/root.jsx';
import { getAllTodos } from './reducers/selectors.js';
import { fetchTodos } from './util/todo_api_util.js'


window.store = store;
window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.getAllTodos = getAllTodos;
window.fetchTodos = fetchTodos;

document.addEventListener('DOMContentLoaded', () => {
  const main = document.getElementById('content')
  

    ReactDOM.render(<Root store={store} />, main)
});

// function Todos(props){
//     return <h1>TODO's APP</h1>;
// };