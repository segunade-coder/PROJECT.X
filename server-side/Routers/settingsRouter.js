const express = require("express");
const router = express.Router();
const multer = require("multer");
const storage = multer.memoryStorage();

const upload = multer({ storage: storage });
const {
  fetchAllSettingsData,
  uploadLogo,
  editCurrentSession,
  editCurrentTerm,
  saveDataToDatabase,
  updateClass,
  configureBackup,
  backupHistory,
  autoImportClasses,
  saveFeeToHistory,
} = require("../Controllers/settings");
const {
  createWallet,
  switchDefaultWallet,
  transferFunds,
  makeExpenses,
  createChart,
  getExpenseHistory,
} = require("../Controllers/wallets");
router
  .get("/", fetchAllSettingsData)
  .post("/upload-logo", upload.single("image"), uploadLogo)
  .post("/edit-current-session", editCurrentSession)
  .post("/edit-current-term", editCurrentTerm)
  .post("/save", saveDataToDatabase)
  .post("/update-class", updateClass)
  .get("/backup", configureBackup)
  .get("/backup-record", backupHistory)
  .post("/add-wallet", createWallet)
  .post("/switch-default", switchDefaultWallet)
  .post("/transfer-funds", transferFunds)
  .post("/add-expense", makeExpenses)
  .post("/chartData", createChart)
  .get("/expense/history", getExpenseHistory)
  .get("/autoimport", autoImportClasses)
  .post("/save-fee-history", saveFeeToHistory);
module.exports = router;
