import React, { useEffect, useState } from 'react';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogActions,
  Button,
  TextField,
  Drawer,
  List,
  ListItem,
  ListItemText,
  IconButton,
} from '@mui/material';
import AddIcon from '@mui/icons-material/Add';
import EditIcon from '@mui/icons-material/Edit';
import DeleteIcon from '@mui/icons-material/Delete';
import axios from 'axios';

const ProductTable = () => {
  const [products, setProducts] = useState([]);
  const [selectedProduct, setSelectedProduct] = useState(null);
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);
  const [updateData, setUpdateData] = useState({
    Name: '',
    Description: '',
    CategoryID: '',
    CostPrice: '',
    SellingPrice: '',
    QuantityInStock: '',
    ReorderLevel: '',
    Barcode: '',
    LastRestockDate: '',
  });

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('http://localhost:8001/m/stock');
        console.log("HEllo");
        console.log(response);
        setProducts(response.data); // Assuming the API response is an array of products
        products.LastRestockDate = products.LastRestockDate
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchData();
  }, []);

  const handleRowClick = (product) => {
    setSelectedProduct(product);
    setIsDialogOpen(true);
    setUpdateData({ ...product }); // Initialize updateData with current product details
  };

  const handleCloseDialog = () => {
    setIsDialogOpen(false);
  };

  const handleUpdate = async () => {
    try {
      await axios.put(`http://localhost:8001/m/stock/${selectedProduct.ProductID}`, updateData);
      // Assuming a successful update, you might want to refresh the data
      const response = await axios.get('http://localhost:8001/m/stock');
      setProducts(response.data);
      handleCloseDialog();
    } catch (error) {
      console.error('Error updating product:', error);
    }
  };

  const handleDelete = async () => {
    try {
      await axios.delete(`http://localhost:8001/m/stock/${selectedProduct.ProductID}`);
      // Assuming a successful delete, you might want to refresh the data
      const response = await axios.get('http://localhost:8001/m/stock');
      setProducts(response.data);
      handleCloseDialog();
    } catch (error) {
      console.error('Error deleting product:', error);
    }
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setUpdateData((prevData) => ({
      ...prevData,
      [name]: value,
    }));
  };

  const handleDrawerOpen = () => {
    setIsDrawerOpen(true);
  };

  const handleDrawerClose = () => {
    setIsDrawerOpen(false);
  };

  const handleAddProduct = async () => {
    try {
      // Add your logic to send a POST request to create a new product
      await axios.post(`http://localhost:8001/m/stock`, updateData);
      // After successful addition, refresh the data
      const response = await axios.get('http://localhost:8001/m/stock');
      setProducts(response.data);
      handleDrawerClose();
    } catch (error) {
      console.error('Error adding product:', error);
    }
  };

  return (
    <>
      <Paper>
        <TableContainer>
          <Table aria-label="Product table">
          <TableHead>
            <TableRow>
              <TableCell>Product ID</TableCell>
              <TableCell>Name</TableCell>
              <TableCell>Description</TableCell>
              <TableCell>Category ID</TableCell>
              <TableCell>Cost Price</TableCell>
              <TableCell>Selling Price</TableCell>
              <TableCell>Quantity In Stock</TableCell>
              <TableCell>Reorder Level</TableCell>
              <TableCell>Barcode</TableCell>
              <TableCell>Last Restock Date</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {products.map((product) => (
              <TableRow key={product.ProductID} onClick={() => handleRowClick(product)}>
                <TableCell>{product.ProductID}</TableCell>
                <TableCell>{product.Name}</TableCell>
                <TableCell>{product.Description}</TableCell>
                <TableCell>{product.CategoryID}</TableCell>
                <TableCell>{product.CostPrice}</TableCell>
                <TableCell>{product.SellingPrice}</TableCell>
                <TableCell>{product.QuantityInStock}</TableCell>
                <TableCell>{product.ReorderLevel}</TableCell>
                <TableCell>{product.Barcode}</TableCell>
                <TableCell>{product.LastRestockDate}</TableCell>
              </TableRow>
            ))}
          </TableBody>
          </Table>
        </TableContainer>
      </Paper>

      {/* Product Details Dialog */}
      <Dialog open={isDialogOpen} onClose={handleCloseDialog}>
      <DialogTitle>Product Details</DialogTitle>
        <DialogContent>
          {selectedProduct && (
            <>
              {/* Display product details */}
              <div>
                <strong>Product ID:</strong> {selectedProduct.ProductID}
              </div>
              {/* <div>
                <strong>Name:</strong> {selectedProduct.Name}
              </div> */}
              {/* ... (display other details) */}

              {/* Update form */}
              <TextField
                label="Name"
                name="Name"
                value={updateData.Name}
                onChange={handleInputChange}
                fullWidth
                margin="normal"
              />
              <TextField
                label="Description"
                name="Description"
                value={updateData.Description}
                onChange={handleInputChange}
                fullWidth
                margin="normal"
              />
              <TextField
                label="CategoryID"
                name="CategoryID"
                value={updateData.CategoryID}
                onChange={handleInputChange}
                fullWidth
                margin="normal"
              />
              <TextField
                label="CostPrice"
                name="CostPrice"
                value={updateData.CostPrice}
                onChange={handleInputChange}
                fullWidth
                margin="normal"
              />
              <TextField
                label="SellingPrice"
                name="SellingPrice"
                value={updateData.SellingPrice}
                onChange={handleInputChange}
                fullWidth
                margin="normal"
              />
              <TextField
                label="QuantityInStock"
                name="QuantityInStock"
                value={updateData.QuantityInStock}
                onChange={handleInputChange}
                fullWidth
                margin="normal"
              />
              <TextField
                label="ReorderLevel"
                name="ReorderLevel"
                value={updateData.ReorderLevel}
                onChange={handleInputChange}
                fullWidth
                margin="normal"
              />
              <TextField
                label="Barcode"
                name="Barcode"
                value={updateData.Barcode}
                onChange={handleInputChange}
                fullWidth
                margin="normal"
              />
              <TextField
                label="LastRestockDate"
                name="LastRestockDate"
                value={updateData.LastRestockDate}
                onChange={handleInputChange}
                fullWidth
                margin="normal"
              />

              {/* Update and Delete buttons */}
              <DialogActions>
                <Button color="primary" onClick={handleUpdate}>
                  Update
                </Button>
                <Button color="error" onClick={handleDelete}>
                  Delete
                </Button>
                <Button onClick={handleCloseDialog}>Close</Button>
              </DialogActions>
            </>
          )}
        </DialogContent>
      </Dialog>

      {/* Add Product Drawer */}
      <Drawer anchor="right" open={isDrawerOpen} onClose={handleDrawerClose}>
        <List>
          <ListItem>
            <ListItemText primary="Add New Product" />
            <IconButton onClick={handleDrawerClose}>
              <AddIcon />
            </IconButton>
          </ListItem>
          {/* Add form fields for adding a new product */}
          <ListItem>
            <TextField
              label="Name"
              name="Name"
              //value={updateData.Name}
              onChange={handleInputChange}
              fullWidth
              margin="normal"
            />
          </ListItem>
          <ListItem>
            <TextField
              label="Description"
              name="Description"
              //value={updateData.Description}
              onChange={handleInputChange}
              fullWidth
              margin="normal"
            />
          </ListItem>
          <ListItem>
            <TextField
              label="CategoryID"
              name="CategoryID"
              //value={updateData.CategoryID}
              onChange={handleInputChange}
              fullWidth
              margin="normal"
            />
          </ListItem>
          <ListItem>
            <TextField
              label="CostPrice"
              name="CostPrice"
              //value={updateData.CostPrice}
              onChange={handleInputChange}
              fullWidth
              margin="normal"
            />
          </ListItem>
          <ListItem>
            <TextField
              label="SellingPrice"
              name="SellingPrice"
              //value={updateData.SellingPrice}
              onChange={handleInputChange}
              fullWidth
              margin="normal"
            />
          </ListItem>
          <ListItem>
            <TextField
              label="QuantityInStock"
              name="QuantityInStock"
              //value={updateData.QuantityInStock}
              onChange={handleInputChange}
              fullWidth
              margin="normal"
            />
          </ListItem>
          <ListItem>
            <TextField
              label="ReorderLevel"
              name="ReorderLevel"
              //value={updateData.ReorderLevel}
              onChange={handleInputChange}
              fullWidth
              margin="normal"
            />
          </ListItem>
          <ListItem>
            <TextField
              label="Barcode"
              name="Barcode"
              //value={updateData.Barcode}
              onChange={handleInputChange}
              fullWidth
              margin="normal"
            />
          </ListItem>
          
          <ListItem>
            <Button color="primary" onClick={handleAddProduct}>
              Add Product
            </Button>
          </ListItem>
        </List>
      </Drawer>

      {/* Floating Action Button for Add Product */}
      <IconButton
        style={{ position: 'fixed', bottom: '16px', right: '16px',
                  backgroundColor:'green', color:'white', width:'50px', height:'50px' }}
        onClick={handleDrawerOpen}
      >
        <AddIcon />
      </IconButton>
    </>
  );
};

export default ProductTable;
