const express = require('express');
const router = express();

const db = require('../db');

// Get data of all the users
router.get('/', async(req,res)=>{
    const [users] = await db.query("SELECT * FROM user");
    res.send(users);
    console.log(users);
})

// Get data of a unique user
router.get('/:id', async(req,res)=>{
    const [user] = await db.query("SELECT * FROM user WHERE userID = ?", req.params.id);
    res.send(user);
})

// Remove user
router.delete('/:id', async(req,res)=>{
    const affectedRows = await db.query("DELETE FROM user WHERE userID = ?", req.params.id);
    if (affectedRows == 0)
        res.status(404).json("No category with the given id " + req.params.id);
    else res.send("Category deleted successfully.");
})

module.exports = router;