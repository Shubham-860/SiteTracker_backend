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

// login
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
        // console.log(data)
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

// get Workdone
app.get('/getWorkDone', (req, res) => {
    const sql = "SELECT * FROM workdone";
    db.query(sql, (err, data) => {
        if (err) {
            return res.json(err)
        }
        console.log(data)
        return res.json(data)
    })
})

// get driverssalary
app.get('/getDriversSalary', (req, res) => {
    const sql = "SELECT * FROM driverssalary";
    db.query(sql, (err, data) => {
        if (err) {
            return res.json(err)
        }
        console.log(data)
        return res.json(data)
    })
})

// get driverssalary
app.get('/dieselpurchase', (req, res) => {
    const sql = "SELECT * FROM dieselpurchase";
    db.query(sql, (err, data) => {
        if (err) {
            return res.json(err)
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

        db.query(insertSql, [values], (err) => {
            if (err) {
                db.rollback(() => {
                    return res.json('error ' + err);
                });
            }

            db.query(updateSql, [quantity, idStockDiesel], (err) => {
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

// addDriver
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


// fuelPurchase
app.post('/fuelPurchase', (req, res) => {
    const insertSql = "INSERT INTO dieselpurchase (`date`, `PumpName`, `PumpAddress`, `Remark`, `Rate`, `Quantity`, `Total`, `uid`) VALUES (?)";
    const updateSql = "UPDATE stockdiesel SET stock = stock + ? WHERE idstockDiesel = ?";
    const paymentSql = "INSERT INTO payments (`uid`, `amount`, `from`, `to`, `subject`, `type`, `date`) VALUES (?)";
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
    const paymentValues = [
        req.body.uid,
        req.body.Total,
        req.body.from,
        req.body.to,
        req.body.subject,
        req.body.type,
        req.body.date,
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

                db.query(paymentSql, [paymentValues], (err, paymentResult) => {
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
});

// add Vehicle
app.post('/addDriverSalary', (req, res) => {
    const sql = "Insert into driverssalary (`uid`,`DriverName`,`PayDay`,`Month`,`AmountToPay`,`TotalHours`) values (?)";
    const paymentSql = "Insert into payments (`uid`,`amount`,`from`,`to`,`subject`,`type`,`date`) values (?)";
    const values = [
        req.body.uid,
        req.body.DriverName,
        req.body.PayDay,
        req.body.Month,
        req.body.AmountToPay,
        req.body.TotalHours,
    ]
    console.log(values)
    // console.log(req.body)
    db.query(sql, [values], (err, data) => {
        if (err) {
            return res.json('error ' + err)
        }
        const paymentValues = [
            req.body.uid,
            req.body.AmountToPay,
            req.body.from,
            req.body.to,
            req.body.subject,
            req.body.type,
            req.body. PayDay,
        ]
        db.query(paymentSql, [paymentValues], (err, data) => {
                if (err) {
                    return res.json('error ' + err)
                }
                return res.json('Data added sucessfully')

            }
        )
        return res.json(data)

    })
})


// site payment

app.post('/sitePayment', (req, res) => {
    const sitePaymentSql = "INSERT INTO sitepayment (`SiteName`, `FixedAmount`, `PayingAmount`, `Date`, `uid`) VALUES ?";
    const paymentSql = "INSERT INTO payments (`uid`, `amount`, `from`, `to`, `subject`, `type`, `date`) VALUES (?)";
    const updateSiteSql = "UPDATE site SET PaidAmount = PaidAmount + ? WHERE SiteName = ?";

    const sitePaymentValues = [
        [
            req.body.SiteName,
            req.body.FixedAmount,
            req.body.PayingAmount,
            req.body.Date,
            req.body.uid,
        ],
    ];

    console.log(sitePaymentValues);

    db.beginTransaction((err) => {
        if (err) {
            return res.json('error ' + err);
        }

        db.query(sitePaymentSql, [sitePaymentValues], (err, sitePaymentResult) => {
            if (err) {
                db.rollback(() => {
                    return res.json('error ' + err);
                });
            }

            const paymentValues = [
                req.body.uid,
                req.body.PayingAmount,
                req.body.from,
                req.body.to,
                req.body.subject,
                req.body.type,
                req.body.Date,
            ];

            db.query(paymentSql, [paymentValues], (err, paymentResult) => {
                if (err) {
                    db.rollback(() => {
                        return res.json('error ' + err);
                    });
                }
                // return res.json('working');
                const updateSiteValues = [
                    req.body.PaidAmount,
                    req.body.SiteName,
                ];
                console.log('updateSiteValues')
                console.log(updateSiteValues)
                db.query(updateSiteSql, updateSiteValues, (err, updateSiteResult) => {
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

                        return res.json('Data added successfully');
                    });
                });
            });
        });
    });
});


// delete


//drivers
app.delete('/deleteDriver/:id', (req, res) => {
    const sql = 'delete from drivers where iddrivers =?'
    const id = req.params.id
    console.log(id)

    db.query(sql, [id], (err) => {
        if (err) {
            // console.log('err')
            // console.log(err)
            return res.json(err)
        } else {
            // console.log('data')
            // console.log(data)
            return res.json('driver deleted successfully')
        }
    })
})

//vehicles
app.delete('/deleteVehicles/:id', (req, res) => {
    const sql = 'delete from vehicles where idvehicles =?'
    const id = req.params.id
    console.log(id)

    db.query(sql, [id], (err) => {
        if (err) {
            // console.log('err')
            // console.log(err)
            return res.json(err)
        } else {
            // console.log('data')
            // console.log(data)
            return res.json('vehicles deleted successfully')
        }
    })
})

// delete workdone
app.delete('/deleteWorkDone/:id', (req, res) => {
    const sql = 'delete from workdone where idworkdone =?'
    const id = req.params.id
    console.log(id)

    db.query(sql, [id], (err) => {
        if (err) {
            // console.log('err')
            // console.log(err)
            return res.json(err)
        } else {
            // console.log('data')
            // console.log(data)
            return res.json('work done deleted successfully')
        }
    })
})

// deleteFuelPurchase
app.post('/deleteFuelPurchase/:iddieselPurchase', (req, res) => {
    const iddieselPurchase = req.params.iddieselPurchase;
    const updateStockSql = "UPDATE stockdiesel SET stock = stock - (SELECT Quantity FROM dieselpurchase WHERE iddieselPurchase = ?) WHERE idstockDiesel = ?";
    const deletePaymentsSql = "DELETE FROM payments WHERE uid = (SELECT uid FROM dieselpurchase WHERE iddieselPurchase = ?)";
    const deleteDieselPurchaseSql = "DELETE FROM dieselpurchase WHERE iddieselPurchase = ?";

    db.beginTransaction((err) => {
        if (err) {
            return res.json('error ' + err);
        }

        db.query(updateStockSql, [iddieselPurchase, stockDieselId], (err, updateResult) => {
            if (err) {
                db.rollback(() => {
                    return res.json('error ' + err);
                });
            }

            db.query(deletePaymentsSql, [iddieselPurchase], (err, deletePaymentsResult) => {
                if (err) {
                    db.rollback(() => {
                        return res.json('error ' + err);
                    });
                }

                db.query(deleteDieselPurchaseSql, [iddieselPurchase], (err, deleteDieselPurchaseResult) => {
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

                        return res.json('Fuel purchase and related data successfully deleted');
                    });
                });
            });
        });
    });
});


app.listen(8081, () => {
    console.log('listening on 8081');
})
