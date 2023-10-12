// importing express module for creating server and routes
const express = require("express");
const {
  fetchUsers,
  createUser,
  editUser,
  deleteUser,
  makeUserAdmin,
} = require("../Controllers/users");

const router = express.Router();

// route to get all the user pertaining to the logged school
router
  .get("/", fetchUsers)

  // route to add a user to the current logged school
  .post("/add", createUser)

  // route to edit user status
  .post("/edit", editUser)

  // route to delete user from database
  .post("/delete-user", deleteUser)
  .post("/add-admin", makeUserAdmin);

module.exports = router;
