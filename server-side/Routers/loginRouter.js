// importing express module for creating server and routes
const express = require("express");
const {
  validateLoginCredentials,
  findAllSchools,
} = require("../Controllers/login");

const router = express.Router();

router.get("/schools", findAllSchools).post("/", validateLoginCredentials);

module.exports = router;
