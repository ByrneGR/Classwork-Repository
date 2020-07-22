import React from 'react';
import ToDoListContainer from './todos/todo_list_container.jsx';

class App extends React.Component{

    render(){
        return(
            <div>
            <h1>My Todo List</h1>

            <ToDoListContainer/>
            </div>
        
        );
    }
}

export default App;