import React from 'react';
import ToDoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx'

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }
  render(){
      const {receiveTodo} = this.props;
    
      const todoItems = this.props.todos.map((todo, idx) => {
       return <ToDoListItem key={idx} todo={todo}/>
      })
    

      return(
        // debugger;
        // console.log(this.props.todos)
        // <ul>
        // {listOfToDos}
        // </ul>
        <div>
        <ul>
        {todoItems}
        </ul>
        <TodoForm receiveTodo={ receiveTodo }/>
        </div >
      
      );
  }
}
// const TodoList = () => (
//     <h3>Todo List goes here!</h3>
//     <ul>
//       console.log(props.todos)
//     </ul>
//   );
export default TodoList;