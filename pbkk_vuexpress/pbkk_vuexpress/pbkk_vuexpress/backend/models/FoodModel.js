// import connection
import db from "../config/database.js";

// get all Foods
export const getFoods = (result) => {
    db.query("SELECT * FROM Menu", (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results);
        }
    });
};

// get single Foods
export const getFoodById = (id,result) => {
    db.query("SELECT * FROM Menu WHERE id_menu = ?",[id], (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results[0]);
        }
    });
};

// insert Food
export const insertFood = (data,result) => {
    db.query("INSERT INTO Menu SET ?",data, (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results[0]);
        }
    });
};

// update Food
export const updateFoodById = (data,id,result) => {
    db.query("UPDATE Menu SET nama_menu = ?, harga_menu = ? WHERE id_menu = ?",[data.nama_menu, data.harga_menu, id], (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results);
        }
    });
};

// delete Food
export const deleteFoodById = (id,result) => {
    db.query("DELETE FROM Menu WHERE id_menu = ?",[id], (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results);
        }
    });
};