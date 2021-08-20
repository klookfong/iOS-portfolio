import React from 'react';
import ReactDOM from 'react-dom';

import Home from './home';

// RUN THE FOLLOWING LINES IN TERMINAL:
// npm install
// npm run webpack

document.addEventListener('DOMContentLoaded', function () {
  ReactDOM.render(<Home />, document.getElementById('main'));
});
