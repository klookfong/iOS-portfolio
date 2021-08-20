import mongoose from 'mongoose';

const userSchema = mongoose.Schema({
    username: String,
    email: String,
    first: String,
    last: String
});

const user = mongoose.model('user', userSchema)
export default user;