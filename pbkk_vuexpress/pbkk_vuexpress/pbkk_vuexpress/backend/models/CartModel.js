// import connection
import db from "../config/database.js";

// get all items by user id
export const getAllItems = (id,result) => {
    db.query("SELECT * FROM cart WHERE cart_id_pembeli = ?",[id], (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results);
        }
    });
};

// get a items by user id, food id
export const getAItem = (user,food,result) => {
    db.query("SELECT * FROM cart WHERE cart_id_pembeli = ? AND cart_id_menu = ?",[user, food], (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results);
        }
    });
};

// insert new item to cart
export const insertToCart = (data,result) => {
    db.query("INSERT INTO cart SET ?",data, (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results[0]);
        }
    });
};

// update qty of a cart item
export const updateCartItemQty = (data, result) => {
    console.log("Data yang diterima untuk update:", data); // Tambahkan baris ini untuk logging
    db.query(
        "UPDATE cart SET item_qty = ? WHERE cart_id_pembeli = ? AND cart_id_menu = ?",
        [data.item_qty, data.cart_id_pembeli, data.cart_id_menu],
        (err, results) => {
            if (err) {
                console.log(err);
                result(err, null);
            } else {
                console.log("Update berhasil:", results);
                result(null, results);
            }
        }
    );
};

// delete cart item
export const deleteItemInCart = (user,food,result) => {
    db.query("DELETE FROM cart WHERE cart_id_pembeli = ? AND cart_id_menu = ?",[user,food], (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results);
        }
    });
};

// delete all Items
export const deleteAllItemsByUser = (id,result) => {
    db.query("DELETE FROM cart WHERE cart_id_pembeli = ?",[id], (err,results)=> {
        if (err){
            console.log(err);
            result(err,null);
        }else{
            result(null,results);
        }
    });
};