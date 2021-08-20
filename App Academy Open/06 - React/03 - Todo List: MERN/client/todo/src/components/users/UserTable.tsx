import React, { useEffect, useState } from 'react'
import { Grid, Typography, Card, CardContent, CardActions, Button } from '@material-ui/core'
import axios from 'axios'

const exampleUsers = ""

export default function UserTable() {
    const deleteUser = function(id: string){
        axios.delete(`http://localhost:5000/users/${id}`).then(() => window.location.reload());
    }
    let [exampleUsers, setExampleUsers] = useState<any[]>([]);
    useEffect(() => {
        axios.get("http://localhost:5000/users").then((users) => {
             setExampleUsers(users.data);
        }).catch((error) => {
            console.log(error.message)
        }
        )
    },[]);
    console.log(exampleUsers)
    return (
        <div> 
            <Grid container spacing={2}>
                {
                    exampleUsers.map((user, i) => {
                        return <Grid key={i} item sm={6} md={4} lg={3}>
                            <Card>
                                <CardContent>
                                    <Typography gutterBottom variant="h5" component="h2">
                                    {user.username}
                                    </Typography>
                                    <Typography>
                                    {user.first} {user.last}
                                    </Typography>
                                    <Typography variant="h6">
                                        {user.email}
                                    </Typography>
                                </CardContent>
                                <CardActions>
                                    <Button size="small" color="primary" onClick={()=>deleteUser(user._id)}>
                                    Delete
                                    </Button>
                                </CardActions>
                            </Card>
                        </Grid>
                    })
                }
            </Grid>
        </div>
    )
}
