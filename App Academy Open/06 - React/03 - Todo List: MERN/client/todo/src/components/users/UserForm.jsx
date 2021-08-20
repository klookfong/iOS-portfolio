import { TextField, Button } from '@material-ui/core'
import React from 'react'
import axios from 'axios';

const makeUser = (username, first, last, email) => ({
    username: username, email: email, first: first, last: last
}); 

export default function UserForm() {
    const username = React.createRef();
    const first = React.createRef();
    const last = React.createRef();
    const email = React.createRef();
    const handleClick = function(event){
        event.preventDefault();
        const user = makeUser(
            username.current.value,
            first.current.value,
            last.current.value,
            email.current.value
        );
        axios.post("http://localhost:5000/users/", user).then(() => window.location.reload());
    }
    return (
        <div>
            <form noValidate>
                <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    id="email"
                    label="Email Address"
                    name="email"
                    autoComplete="email"
                    autoFocus
                    inputRef={email}
                />
                <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    name="first"
                    label="First"
                    id="first"
                    inputRef={first}
                />
                <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    name="last"
                    label="last"
                    id="last"
                    inputRef={last}
                />
                <TextField
                    variant="outlined"
                    margin="normal"
                    required
                    fullWidth
                    name="username"
                    label="username"
                    id="username"
                    inputRef={username}
                />
                <Button
                    type="submit"
                    fullWidth
                    variant="contained"
                    color="primary"
                    onClick={handleClick}
                >
                    Create new User
                </Button>
            </form>
        </div>
    )
}
