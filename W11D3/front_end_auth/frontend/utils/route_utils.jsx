import React from 'react';
import { connect } from 'react-redux';
import { Redirect, Route, withRouter } from 'react-router-dom';

const mapStateToProps = state => ({
  loggedIn: Boolean(state.session.currentUser)
})

/* <AuthRoute path="" component={} /> */

//auth route, redirect users who are already logged in if they're trying to login again
const Auth = ({loggedIn, path, component: Component}) => (
  <Route
    path={path}
    render={props => (
      loggedIn ? <Redirect to="/" /> : <Component {...props} />
    )}
  />
);

const Protected = ({ loggedIn, path, component: Component}) => (
  <Route
    path={path}
    render={props => (
      loggedIn ? <Component {...props} /> : <Redirect to="/signup" />
    )}
  />  
);

export const AuthRoute = withRouter(connect(mapStateToProps)(Auth))
export const ProtectedRoute = withRouter(connect(mapStateToProps)(Protected));


