import React from 'react';
import { uniqueId } from '../../util/id_generator.js'

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: "", body: "", done: false}

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(property) {
    return e => this.setState({[property]: e.target.value})
  }

  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state);
    console.log(this.props);
    this.props.receiveTodo(todo);

  }

  render () {
    return (
      <div>
        <form className = "todoForm" onSubmit={this.handleSubmit}>

        <label>Title
        <input type="text" value={this.state.title} onChange={this.update("title")}></input>
        </label>

        <button>Submit</button>



        </form>
      </div>
    )
  }
}
export default TodoForm;