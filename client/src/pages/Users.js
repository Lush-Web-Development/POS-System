import React, { useState, useEffect } from 'react';
import axios from 'axios';
import {
  Container,
  Paper,
  List,
  ListItem,
  ListItemText,
  Button,
  Drawer,
  TextField,
} from '@mui/material';

const UsersPage = () => {
  const [users, setUsers] = useState([]);
  const [selectedUser, setSelectedUser] = useState(null);
  const [drawerOpen, setDrawerOpen] = useState(false);

  const fetchData = async () => {
    try {
      const response = await axios.get('http://localhost:8001/users/');
      console.log(response);
      setUsers(response.data);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  useEffect(() => {
    fetchData();
  }, []);

  const handleUserClick = (user) => {
    setSelectedUser(user);
    setDrawerOpen(true);
  };

  const handleDrawerClose = () => {
    setDrawerOpen(false);
  };

  const handleDeleteUser = async (userId) => {
    try {
      await axios.delete(`http://localhost:8001/users/${userId}`);
      fetchData();
    } catch (error) {
      console.error('Error deleting user:', error);
    }
  };

  const handleUpdateUser = async () => {
    // Implement update logic here
    // You may want to show a form in the drawer for updating user details
    // and handle the update API call.
  };

  return (
    <Container>
      <Paper elevation={3} style={{ padding: '20px', margin: '20px' }}>
        <h2>User List</h2>
        <List>
          {users.map((user) => (
            <ListItem key={user.UserID} button onClick={() => handleUserClick(user)}>
              <ListItemText primary={user.Username} />
              <ListItemText primary={user.Role} />
              <Button onClick={() => handleDeleteUser(user.id)} color="secondary">
                Delete
              </Button>
            </ListItem>
          ))}
        </List>
      </Paper>

      <Drawer anchor="right" open={drawerOpen} onClose={handleDrawerClose}>
        {selectedUser && (
          <div style={{ padding: '20px' }}>
            <h2>User Profile</h2>
            <TextField
              label="Name"
              value={selectedUser.name}
              onChange={(e) =>
                setSelectedUser({ ...selectedUser, name: e.target.value })
              }
              fullWidth
            />
            {/* Add more fields as needed for user details */}
            <Button onClick={handleUpdateUser} color="primary">
              Update
            </Button>
          </div>
        )}
      </Drawer>
    </Container>
  );
};

export default UsersPage;
