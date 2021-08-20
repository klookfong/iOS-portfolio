import React from 'react';
import './App.css';
import UserTable from './components/users/UserTable';
import UserForm from './components/users/UserForm.jsx';
import { Typography, CssBaseline, AppBar, Toolbar } from '@material-ui/core';
import useStyles from './styles';

function App() {
  const classes = useStyles();
  return (
    <div className="App App-header">
      <CssBaseline />
      <AppBar className={classes.appBar} position="sticky" color="inherit">
        <Toolbar>
          <Typography variant="h5">Todo List</Typography>
        </Toolbar>
      </AppBar>
      <main>
        <UserTable />
        <UserForm />
      </main>
    </div>
  );
}

export default App;
