import TodoList from './todo_list.jsx'
import { connect } from 'react-redux'


const mapStateToProps = (state) => {
    return {todos: getAllTodos(state)};

};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo)) // keys into a function that dispatches the action (returned by invoking the action creator)
  };
};


export default connect(mapStateToProps, mapDispatchToProps)(TodoList)