const express = require("express");
const {
  autoCompleteName,
  printDisplay,
  fetchAllRecords,
  findSearchRecord,
  deleteRecord,
  editRecord,
  findDebtors,
  prepareWeeklyReport,
  prepareStatement,
} = require("../Controllers/records");
const {
  fetchNotifications,
  deleteNotification,
} = require("../Controllers/notifications");
const router = express.Router();

router
  .post("/find-name", autoCompleteName)
  .post("/findId", findSearchRecord)
  .post("/records", fetchAllRecords)
  .get("/get-view", printDisplay)
  .get("/delete", deleteRecord)
  .post("/edit", editRecord)
  .post("/debtors", findDebtors)
  .post("/weekly", prepareWeeklyReport)
  .post("/statement", prepareStatement)
  .get("/notifications", fetchNotifications)
  .get("/deleteNoti", deleteNotification);

module.exports = router;
