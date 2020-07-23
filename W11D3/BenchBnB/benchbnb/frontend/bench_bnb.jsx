import React from 'react';
import ReactDOM from 'react-dom';
// import {logIn, logOut, signUp} from './util/session_api_util'
import configureStore from './store/store';
import Root from './components/root'




document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();


  window.getState = store.getState;
  window.dispatch = store.dispatch;
  // window.logIn = logIn;
  // window.signUp = signUp;
  // window.logOut = logOut;
  
  ReactDOM.render(<Root store={store} />, root);
});