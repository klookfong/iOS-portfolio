import user from "../models/user.js";

export const getAllUsers = async function(req, res)  {
    try {
        const allUsers = await user.find();
        res.status(200).json(allUsers);
    } catch (error) {
         res.status(404).json({"error": error.message});
    }
}

export const postUser = async function(req, res){
    const request = req.body;
    const newUser = new user(request);
    try {
        await newUser.save(); 
        res.status(201).json(newUser);
    } catch (error) {
        res.status(409).json({"error": error.message});
    }
}

export const deleteUser = async function(req,res){
    const id = req.params.id;
    try {
        await user.findByIdAndRemove(id).exec();
        res.send("Successfully deleted")
    } catch (error) {
        console.log(error.message)
    }
}