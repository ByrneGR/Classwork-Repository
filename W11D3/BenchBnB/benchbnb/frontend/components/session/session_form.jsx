import React from 'react'
import {Link} from 'react-router-dom'


class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this)
  }

  handleInput(type) {
    return (e) => {
      this.setState({ [type]: e.target.value} )
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  render() {
    const formType = this.props.formType
    const errors = this.props.errors
    let form;

    if (formType === "login") {

      form = (
        <div>
          <h3>Please log in or <Link to="/signup">sign up instead</Link></h3>
          <form>
            <label>Username: 
            <input type="text" value={this.state.username} onChange={this.handleInput('username')}/>
            </label>

            <label>Password:
              <input type="password" value={this.state.password} onChange={this.handleInput('password')}/>
            </label>
          
          <button onClick={this.handleSubmit}>Log In</button>
          
          </form>
        </div>
      )
    } else if (formType === "signup") {

      form = (
        <div>
          <h3>Please sign up or <Link to="/login">log in instead</Link></h3>
          <form>
            <label>Username:
            <input type="text" value={this.state.username} onChange={this.handleInput('username')} />
            </label>

            <label>Password:
              <input type="password" value={this.state.password} onChange={this.handleInput('password')} />
            </label>

            <button onClick={this.handleSubmit}>Sign Up</button>

          </form>
        </div>
      )
    }

    return (
      <div>
        <h2>Welcome to BenchBNB!</h2> 
        {form}
        {errors}
      </div>
    );


  }
}

export default SessionForm;