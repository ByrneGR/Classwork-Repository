import { merge } from 'lodash';
import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions.js';

export const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};


const todosReducer = (state= initialState, action)=>{
    Object.freeze(state);
    let nextState = {}

    switch(action.type){ // switch starts up if action.type is truthy (which itll always be)
        case RECEIVE_TODOS:
            action.todos.forEach( todo => {
              nextState[todo.id] = todo;
            })
            return nextState;
        case RECEIVE_TODO:
            const id = action.todo.id;
            const newTodo = {[id]: action.todo} //why is this in brackets? for dynamic changing keys, else it will make the key a literal string
            const newState = Object.assign({}, state, newTodo);
            return newState;

        default: return state;
    }
    
};

export default todosReducer;