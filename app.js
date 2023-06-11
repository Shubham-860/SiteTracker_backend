const express = require('express');
const cors = require('cors');
const mysql = require('mysql');

const app = express();
app.use(express.json())
app.use(cors());

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "1234",
    database: "land_development",
})
db.connect();

app.post('/login', (req, res) => {
    const sql = 'SELECT * FROM user WHERE email = ? AND password = ?'

    db.query(sql, [req.body.email, req.body.password,], (err, data) => {
        if (err) {
            return res.json('error ' + err)
        }
        if (data.length > 0) {
            return res.json(data)
        } else {
            return res.json('No records found')
        }
    })
})

// sql quires

// Read data

// get users
app.get('/getUsers', (req, res) => {
    const sql = "SELECT * FROM user";
    db.query(sql, (err, data) => {
        if (err) {
            return res.json("error 1 " + err)
        }
        return res.json(data)
    })
})

// get drivers
app.get('/getDrivers', (req, res) => {
    const sql = "SELECT * FROM drivers";
    db.query(sql, (err, data) => {
        if (err) {
            return res.json("error 1 " + err)
        }
        console.log(data)
        return res.json(data)
    })
})


// get vehicles
app.get('/getVehicles', (req, res) => {
    const sql = "SELECT * FROM vehicles";
    db.query(sql, (err, data) => {
        if (err) {
            return res.json("error 1 " + err)
        }
        console.log(data)
        return res.json(data)
    })
})


// get stock diesel
app.get('/getStockDiesel', (req, res) => {
    const sql = "SELECT * FROM stockdiesel";
    db.query(sql, (err, data) => {
        if (err) {
            return res.json("error 1 " + err)
        }
        return res.json(data)
        console.log('valuesss '+ data)
    })
})

// get stock diesel
app.get('/getSite', (req, res) => {
    const sql = "SELECT * FROM site";
    db.query(sql, (err, data) => {
        if (err) {
            return res.json("error 1 " + err)
        }
        console.log(data)
        return res.json(data)
    })
})


// Write data

// add Site
app.post('/addSite', (req, res) => {
    const sql = "Insert into site (`OwnerName`,`SiteName`,`Contact`,`Email`,`SiteAddress`,`Remark`,`FixedAmount`,`PaidAmount`) values (?)";
    const values = [
        req.body.OwnerName,
        req.body.SiteName,
        req.body.Contact,
        req.body.Email,
        req.body.SiteAddress,
        req.body.Remark,
        req.body.FixedAmount,
        req.body.PaidAmount,
    ]
    console.log(values)
    // console.log(req.body)
    db.query(sql, [values], (err, data) => {
        if (err) {
            return res.json('error ' + err)
        }
        return res.json(data)
    })
})

// add work done
// app.post('/addWorkDone', (req, res) => {
//     const sql = "Insert into workdone ( `VehicleNumber`,`DriverName`,`SiteName`,`WorkDate`,`StartTime`,`EndTime`,`WorkingStatus`,`Remark`,`DieselConsumption`,`RatePerHour`,`TotalPayableHours`,`AmountToPay` ) values (?)";
//     const values = [
//         req.body.VehicleNumber,
//         req.body.DriverName,
//         req.body.SiteName,
//         req.body.WorkDate,
//         req.body.StartTime,
//         req.body.EndTime,
//         req.body.WorkingStatus,
//         req.body.Remark,
//         req.body.DieselConsumption,
//         req.body.RatePerHour,
//         req.body.TotalPayableHours,
//         req.body.AmountToPay,
//     ]
//     console.log(values)
//     // console.log(req.body)
//     db.query(sql, [values], (err, data) => {
//         if (err) {
//             return res.json('error ' + err)
//         }
//         return res.json(data)
//     })
// })

app.post('/addWorkDone', (req, res) => {
    const insertSql = "Insert into workdone ( `VehicleNumber`,`DriverName`,`SiteName`,`WorkDate`,`StartTime`,`EndTime`,`WorkingStatus`,`Remark`,`DieselConsumption`,`RatePerHour`,`TotalPayableHours`,`AmountToPay` ) values (?)";
    const updateSql = "UPDATE stockdiesel SET stock = stock - ? WHERE idstockDiesel = ?";

    const values = [
        req.body.VehicleNumber,
        req.body.DriverName,
        req.body.SiteName,
        req.body.WorkDate,
        req.body.StartTime,
        req.body.EndTime,
        req.body.WorkingStatus,
        req.body.Remark,
        req.body.DieselConsumption,
        req.body.RatePerHour,
        req.body.TotalPayableHours,
        req.body.AmountToPay,
    ]
    const quantity = req.body.DieselConsumption;
    const idStockDiesel = 1;
    console.log(values)

    db.beginTransaction((err) => {
        if (err) {
            return res.json('error ' + err);
        }

        db.query(insertSql, [values], (err, insertResult) => {
            if (err) {
                db.rollback(() => {
                    return res.json('error ' + err);
                });
            }

            db.query(updateSql, [quantity, idStockDiesel], (err, updateResult) => {
                if (err) {
                    db.rollback(() => {
                        return res.json('error ' + err);
                    });
                }

                db.commit((err) => {
                    if (err) {
                        db.rollback(() => {
                            return res.json('error ' + err);
                        });
                    }

                    return res.json('Work-done successfully recorded');
                });
            });
        });
    });
})

// fuelPurchase

app.post('/fuelPurchase', (req, res) => {
    const insertSql = "INSERT INTO dieselpurchase (`date`, `PumpName`, `PumpAddress`, `Remark`, `Rate`, `Quantity`, `Total`, `uid`) VALUES (?)";
    const updateSql = "UPDATE stockdiesel SET stock = stock + ? WHERE idstockDiesel = ?";
    const values = [
        req.body.date,
        req.body.PumpName,
        req.body.PumpAddress,
        req.body.Remark,
        req.body.Rate,
        req.body.Quantity,
        req.body.Total,
        req.body.uid,
    ];
    const quantity = req.body.Quantity;
    const idStockDiesel = 1; // Replace with the appropriate value for your use case

    db.beginTransaction((err) => {
        if (err) {
            return res.json('error ' + err);
        }

        db.query(insertSql, [values], (err, insertResult) => {
            if (err) {
                db.rollback(() => {
                    return res.json('error ' + err);
                });
            }

            db.query(updateSql, [quantity, idStockDiesel], (err, updateResult) => {
                if (err) {
                    db.rollback(() => {
                        return res.json('error ' + err);
                    });
                }

                db.commit((err) => {
                    if (err) {
                        db.rollback(() => {
                            return res.json('error ' + err);
                        });
                    }

                    return res.json('Fuel purchase successfully recorded');
                });
            });
        });
    });
});

// fuelPurchase
app.post('/addDriver', (req, res) => {
    const sql = "Insert into drivers (`DriverName`,`DriverContact`,`DriverAddress`,`AadharCard`,`DrivingLicense`,`JoinDate`,`RatePerHour`,`Remark`) values (?)";
    const values = [
        req.body.DriverName,
        req.body.DriverContact,
        req.body.DriverAddress,
        req.body.AadharCard,
        req.body.DrivingLicense,
        req.body.JoinDate,
        req.body.RatePerHour,
        req.body.Remark,
    ]
    console.log(values)
    // console.log(req.body)
    db.query(sql, [values], (err, data) => {
        if (err) {
            return res.json('error ' + err)
        }
        return res.json(data)
    })
})

// add Vehicle
app.post('/addVehicle', (req, res) => {
    const sql = "Insert into vehicles (`VehicleNumber`,`VehicleType`,`VehicleChassisNumber`,`VehiclePurchaseDate`,`VehicleAVG`,`Remark`) values (?)";
    const values = [
        req.body.VehicleNumber,
        req.body.VehicleType,
        req.body.VehicleChassisNumber,
        req.body.VehiclePurchaseDate,
        req.body.VehicleAVG,
        req.body.Remark,
    ]
    console.log(values)
    // console.log(req.body)
    db.query(sql, [values], (err, data) => {
        if (err) {
            return res.json('error ' + err)
        }
        return res.json(data)

    })
})

app.listen(8081, () => {
    console.log('listening on 8081');
})
