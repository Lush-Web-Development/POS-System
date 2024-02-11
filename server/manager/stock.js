const express = require('express');
const router = express();

const db = require('../db');

router.get('/',async (req,res) =>{
    const [products] = await db.query("SELECT * FROM product");
    res.send(products);
})


router.get('/:id',async (req,res) =>{
    const [products] = await db.query("SELECT * FROM product WHERE Productid = ?",[req.params.id]);
    res.send(products);
})

router.delete('/:id', async(req,res)=>{
    const [details] = await db.query(
        "DELETE FROM product WHERE Productid = ?",
        [parseInt(req.params.id, 10)]
      );
      return details.affectedRows;
})

router.post('/', async (req,res)=>{
    let Name = req.body.Name;
    let Description = req.body.Description;
    let CategoryID = req.body.CategoryID;
    let CostPrice = req.body.CostPrice;
    let SellingPrice = req.body.SellingPrice;
    let QuantityInStock = req.body.QuantityInStock;
    let ReorderLevel = req.body.ReorderLevel;
    let Barcode = req.body.Barcode;
    const today = new Date();
    const formattedDate = today.toISOString().split('T')[0]; // Get the date part in YYYY-MM-DD format
    let LastRestockDate = formattedDate;
    const [details] = await db.query("INSERT INTO product VALUES (?,?,?,?,?,?,?,?,?)",
        [Name,Description,CategoryID,CostPrice,SellingPrice,QuantityInStock,ReorderLevel,Barcode,LastRestockDate]);
    res.status(201).send("A new product added successfully.");
    return details.affectedRows;
});

router.put('/:id', async (req,res)=>{
    const sql = `UPDATE product
                    SET Name=?, Description=?, CategoryID=?, CostPrice=?,
                    SellingPrice=?, QuantityInStock=?, ReorderLevel=?,
                    Barcode=?, LastRestockDate=?
                    WHERE ProductID = ?`;
    let ProductID = parseInt(req.params.id, 10);
    let Name = req.body.Name;
    let Description = req.body.Description;
    let CategoryID = req.body.CategoryID;
    let CostPrice = req.body.CostPrice;
    let SellingPrice = req.body.SellingPrice;
    let QuantityInStock = req.body.QuantityInStock;
    let ReorderLevel = req.body.ReorderLevel;
    let Barcode = req.body.Barcode;
    const today = new Date();
    const formattedDate = today.toISOString().split('T')[0]; // Get the date part in YYYY-MM-DD format
    let LastRestockDate = formattedDate;
    const affectedRows = await db.query(sql,
        [Name,Description,CategoryID,CostPrice,SellingPrice,QuantityInStock,
            ReorderLevel,Barcode,LastRestockDate, ProductID]);
    if( affectedRows == 0 ) res.status(404).json("No product with the given id " + req.params.id);
    else res.send("Product updated successfully.");
});

module.exports = router;