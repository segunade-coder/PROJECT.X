const express = require("express");
const {
  createSchool,
  registerAdmintoSchool,
} = require("../Controllers/register");
const router = express.Router();

router.get("/school", createSchool);
router.post("/admin-reg", registerAdmintoSchool);
module.exports = router;
