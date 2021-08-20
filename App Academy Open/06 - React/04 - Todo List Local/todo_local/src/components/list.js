import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import Divider from '@material-ui/core/Divider';
import { TextField, Button, CssBaseline, Grid, Card, CardContent, CardActions, AppBar, Toolbar, Typography } from '@material-ui/core';
import store from '../models/item.js'

const useStyles = makeStyles((theme) => ({
  root: {
    textAlign: "center",
    color: "black",
    display: "flex",
    alignItems: "center",
    flexDirection: "column",
    height: "100vh",
    marginTop: "1%",
    marginBottom: "10%",
    padding: "9px"
  },
  formGroup:{
    width: "40%",
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    paddingTop: "8%",
    marginBottom: "10px"
  },
  taskTab:{
    display: "flex",
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    paddingBottom: "10px"
  },
  submit: {
    marginLeft: "10px",
    height: "40px",
    width: "180px"
  },
  inputting: {
    width: "500px"
  },
  cardGrid: {
    paddingTop: theme.spacing(8),
    paddingBottom: theme.spacing(8),
  },
  card: {
    height: '100%',
    display: 'flex',
    flexDirection: 'column',
  },
  cardMedia: {
    paddingTop: '56.25%', // 16:9
  },
  cardContent: {
    flexGrow: 1,
  },
}));

function ListItemLink(props) {
  return <ListItem button component="a" {...props} />;
}

export default function TaskList() {
  const hook = store.items.hook(store.items.default)
  const classes = useStyles();
  const addText = React.useRef("");
  if (hook.list ===undefined || hook.list.items===undefined){
    return <div>Loading...</div>
  }
  // const LocalItems = (props) => {
  //   return (
  //     <div className={classes.taskTab}>
  //         <ListItemLink href="#simple-list" onClick={()=>hook.updateList(props.index)}>
  //             <p>{props.item.status ? "✓" : ""}</p>
  //             <ListItemText primary={props.item.task} />
  //         </ListItemLink>
  //         <Button onClick={()=>{
  //               hook.removeItem(props.index);
  //             }}>Delete
  //         </Button>
  //     <Divider />
  //     </div>
  //   )
  // }

  const LocalItems = (props) => {
    return (
      <Grid item key={props.index} xs={6} sm={4} md={3} lg={3}>
      <Card className={classes.card}>
                <CardContent className={classes.cardContent}>
                  <Typography gutterBottom variant="h5" component="h2">
                    {props.item.status ? "✓" : ""}
                  </Typography>
                  <Typography>
                    {props.item.task}
                  </Typography>
                </CardContent>
                <CardActions>
                  <Button size="small" color="primary" onClick={()=>{
                  hook.removeItem(props.index);
                }}>
                    Delete
                  </Button>
                  <Button size="small" color="primary" onClick={()=>hook.updateList(props.index)}>
                    Mark Completed
                  </Button>
                </CardActions>
              </Card>
        </Grid>
    )
  }
  return (
    <div>
      <CssBaseline />
      <AppBar>
        <Toolbar>
          Todo: Local Storage
        </Toolbar>
      </AppBar>
      <div className={classes.root}>
    <form className={classes.formGroup} noValidate autoComplete="off">
      <TextField className={classes.inputting} id="outlined-basic" label="Add Item" variant="outlined" inputRef={addText}/>
      <Button className={classes.submit} variant="contained" fullWidth color="primary" onClick={(event) => {
        event.preventDefault();
        if(addText.current.value !== "") {
          hook.addItem(addText.current.value)
          addText.current.value = "";
        }
      }
      }>Add</Button>
    </form>
    <Grid container spacing={4}>
    {
          hook.list.items.map((item, index) => {
            return <LocalItems item={item} index={index} key={index}/>
          })
        }
    </Grid>
        
    </div>
    </div>
  );
}
