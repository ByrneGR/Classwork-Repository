import React from 'react';
import ReactDOM from 'react-dom';

import Game from './game';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  // const hello = React.createElement('h1', null, 'React is still up!')
  // const hello = <h1>React is Up!</h1>

  ReactDOM.render(<Game />, root);

});