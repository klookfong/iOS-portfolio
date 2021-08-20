import express from 'express';
import mongoose from 'mongoose';
import bodyParser from 'body-parser'; //we no longer need bodyParser
import cors from 'cors';
import nodemon from 'nodemon';


// Make an object of the express class
const app = express();

// Get the connection string for your MongoDB Database Cluster (M)
const CONNECTION_URL = "mongodb+srv://klookfong:Kl2045177$@cluster0.ql1qy.mongodb.net/myFirstDatabase?retryWrites=true&w=majority";

// Use the following packages in the Express App (E)
app.use(express.json({limit: "20mb", extended: true}));
app.use(express.urlencoded({limit: "20mb", extended: true}));
app.use(cors());


// Define the routes in the application
import userRoutes from './routes/user.js';
app.use('/users', userRoutes)

// Define the port for the server side of the application to be run on
const PORT = process.env.PORT || 5000;

// Connect to MongoDB
mongoose.connect(CONNECTION_URL, ({ useNewUrlParser: true,
    useCreateIndex: true,
    useUnifiedTopology: true}))
    .then(() => {
        app.listen(PORT, () => console.log(`Connection established, running on port ${PORT}`));
    })
    .catch((error) => console.log(error.message));

mongoose.set("useFindAndModify", false);



