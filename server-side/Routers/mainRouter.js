const express = require("express");
const router = express.Router();

const paymentRoute = require("./paymentRouter");
const dashboardRoute = require("./dashboardRouter");
const settingsRoute = require("./settingsRouter");
const usersRoute = require("./usersRouter");
const feesRoute = require("./feesRouter");
const studentsRoute = require("./studentsRouter");
const recordsRoute = require("./recordsRouter");
const {
  checkAuth,
  checkAdmin,
  getLogo,
  getSchoolInfo,
} = require("../Controllers/main");

router
  .get("/", checkAuth, getSchoolInfo)
  .get("/image", checkAuth, getLogo)
  .use("/dashboard", checkAuth, dashboardRoute)
  .use("/students", checkAuth, studentsRoute)
  .use("/payment", checkAuth, paymentRoute)
  .use("/users", [checkAuth, checkAdmin], usersRoute)
  .use("/settings", [checkAuth, checkAdmin], settingsRoute)
  .use("/fees", checkAuth, feesRoute)
  .use("/records", checkAuth, recordsRoute);

module.exports = router;
