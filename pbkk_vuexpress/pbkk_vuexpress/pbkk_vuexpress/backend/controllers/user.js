// import functions from User model
import {
    getAllUser,
    getUserByEmail,
    insertUser
} from "../models/UserModel.js";

// get all Users
export const allUsers=(req,res)=>{
    getAllUser((err,results)=> {
        if (err) {
            res.send(err);
        }else {
            res.json(results);
        }
    });
};

// get single user
export const showAUser = (req,res)=>{
    getUserByEmail(req.params.email,(err,results)=> {
        if (err) {
            res.send(err);
        }else {
            res.json(results);
        }
    });
};

// create user
export const createAccount = (req, res) => {
    const data = req.body;
    console.log("Data received in backend:", data);  // Log data untuk debugging
    insertUser(data, (err, results) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(results);
        }
    });
};