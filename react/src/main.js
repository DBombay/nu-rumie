import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UserList from './components/UserList';

$(function() {
  let reactApp = document.getElementById('users')
  if (reactApp) {
    ReactDOM.render(
      <UserList />,
      document.getElementById('users')
    );
  }
});
