import React from 'react';
import { Provider } from 'react-redux';
import App from './app.jsx';
import ToDoListContainer from './todos/todo_list_container.jsx';


const Root = ({ store }) => (
  <Provider store={store}>
    <App />
    {/* <ToDoListContainer /> this is one place you can put it as long as it's imported  */}
  </Provider>
);

export default Root;

