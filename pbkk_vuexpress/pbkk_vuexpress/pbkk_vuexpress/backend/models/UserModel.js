// import connection
import db from "../config/database.js";

// get all user
export const getAllUser = (result) => {
    db.query("SELECT * FROM Pembeli", (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results[0]);
        }
    });
};

// get single user
export const getUserByEmail = (data,result) => {
    db.query("SELECT id_pembeli, nama_pembeli, password_pembeli FROM pembeli WHERE email_pembeli = ?",[data], (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results[0]);
        }
    });
};

// insert User
export const insertUser = (data, result) => {
    db.query("INSERT INTO Pembeli SET ?", data, (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            // Return the newly inserted user ID and the data
            result(null, { id: results.insertId, ...data });
        }
    });
};