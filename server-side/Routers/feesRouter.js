// importing express module for creating server and routes
const express = require("express");
const {
  autoCompleteFindName,
  findSearch,
  loadAllPaymentRecords,
  saveBalancePayment,
  findIndRecord,
} = require("../Controllers/fees");

const router = express.Router();

// route to find name for autocomplete
router
  .post("/find-name", autoCompleteFindName)

  // route to find record using the search id or name.
  .post("/findId", findSearch)

  .post("/ind-record", findIndRecord)
  // route to return records to be displayed when the page first loads
  .get("/records", loadAllPaymentRecords)

  // route to balance fees
  .post("/save", saveBalancePayment);

module.exports = router;
