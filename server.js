require("dotenv").config();
const express = require("express");
const mysql2 = require("mysql2");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.static(__dirname));

// connecting that database

const db = mysql2.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    port: parseInt(process.env.DB_PORT),
    ssl: {
        rejectUnauthorized: false
    }
});

db.connect(function(err){
    if(err){
        console.log("Database connection failed: "+ err.message);
        return;
    }
    console.log("Connected to MySQL database.");
});

// Save transactions

app.post("/add-transaction", function(req,res){
    const{transaction_id,booth,location,service,revenue_per_kwacha,amount,vat,amount_after_tax} = req.body;

    const sql = `INSERT INTO transactions( transaction_id,booth,location,service,revenue_per_kwacha,amount,vat,amount_after_tax)
    VALUES (?,?,?,?,?,?,?,?)`;

    db.query(sql,[transaction_id,booth,location,service,revenue_per_kwacha,amount,vat,amount_after_tax],function(err,result){
        if(err){
            console.log("Insert error: " + err.message);
            res.status(500).json({error: err.message});
            return;  
        }
        res.json({message: "Transaction saved successfully."});
    });
});

// Fetching all transactions

app.get("/get-transactions", function(req, res){
    db.query("SELECT * FROM transactions ORDER BY id ASC",function(err,results){
        if(err){
            console.log("Query error: " + err.message);
            res.status(500).json({error: err.message});
            return;
        }
        res.json(results);
    });
});

// Start server
app.listen(3000,function(){
    console.log("Server running at http://localhost:3000");
});

app.get("/get-last-id",function(req, res){
    db.query("SELECT transaction_id FROM transactions ORDER BY id DESC LIMIT 1", function(err,results){
        if(err){
            res.status(500).json({error : err.message});
            return;
        }
        if(results.length === 0){
            res.json({lastId: 0});
        } else {
            const lastId = parseInt(results[0].transaction_id.replace("WB",""));
            res.json({ lastId: lastId});
        }
    });
});

// fetch services
app.get("/get-services", function(req,res){
    db.query("SELECT * FROM services", function(err,results){
        if(err){
            console.log("Query error: "+ err.message);
            res.status(500).json({error: err.message});
            return;
        }
        res.json(results);
    });
}); 

// fetch booths
app.get("/get-booths", function(req,res){
    db.query("SELECT * FROM booths", function(err,results){
        if(err){
            console.log("Query error: "+ err.message);
            res.status(500).json({error: err.message});
            return;
        }
        res.json(results);
    });
});
