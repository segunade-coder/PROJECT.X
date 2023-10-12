// importing express module for creating server and routes
const express = require("express");
const {
  autoCompleteFindName,
  savePayment,
  fetchClasses,
} = require("../Controllers/Payments");

const router = express.Router();

router
  .get("/classes", fetchClasses)
  .post("/findName", autoCompleteFindName)
  .post("/save", savePayment);

module.exports = router;
