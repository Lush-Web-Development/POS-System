const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const db = require('./db');

// Routes - Import
const userRoutes = require('./services/users');
const stockRoutes = require('./manager/stock');

const app = express();

app.use(cors());
app.use(bodyParser.json());

// Routes - Use
app.use('/users',userRoutes);
app.use('/m/stock',stockRoutes);


db.query("SELECT 1")
    .then((data)=>{
        console.log(data);
        console.log("DB connection succeeded.");
    })
    .then(()=>{
        app.listen(8001,()=>{
            console.log("Listening on port 8001");
        })
    })
    .catch(err=>console.log("DB connection failed."+err))


