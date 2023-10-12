// importing express module for creating server and routes
const express = require("express");
const {
  dashboardDetails,
  changePassword,
  expandDebt,
} = require("../Controllers/dashboard");

const router = express.Router();

// importing connectivity to mysql database

router
  .get("/", dashboardDetails)
  .post("/change-password", changePassword)
  .post("/expand-debt", expandDebt);
// export router
module.exports = router;
