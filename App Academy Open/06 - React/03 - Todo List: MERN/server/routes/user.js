import express from 'express';
import { deleteUser, getAllUsers, postUser } from '../controllers/user.js';

// In the URL, the user can make a GET,POST,DELETE request
const userRoutes = express.Router();

// For the users table in the database



//localhost:5000/users/
userRoutes.get("/", getAllUsers);
userRoutes.post("/", postUser);
userRoutes.delete("/:id", deleteUser)
export default userRoutes;