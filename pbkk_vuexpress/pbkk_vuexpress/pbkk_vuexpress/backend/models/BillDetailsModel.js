// import connection
import db from "../config/database.js";

// insert Bill Details (Detail_Pesanan)
export const insertBillDetails = (data, result) => {
    db.query("INSERT INTO Pesanan_menu SET ?",data, (err,results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};

// get Bill Details (Detail_Pesanan)
export const getBillDetails = (id, result) => {
    db.query("SELECT * FROM Pesanan_menu WHERE pesanan_pm_id_pesanan = ?", [id], (err, results) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, results);
        }
    });
};