

export const getAllTodos = ({ todos }) => { // using these selectors to help our process of formatting to mapStatetoProps
    return Object.keys(todos).map(id => todos[id])
};

