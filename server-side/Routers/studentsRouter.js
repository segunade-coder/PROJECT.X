const express = require("express");
const {
  uploadStudentsByXLsFile,
  addStudent,
  autocompleteFindStudent,
  autocompleteFindGuardian,
  findStudent,
  findGuardian,
  filterByClass,
  fetchStudents,
  printPreview,
  deleteStudent,
  updateStudentInfo,
  promoteStudents,
  deleteMultipleStudents,
  updateMultipleStudents,
} = require("../Controllers/students");
const router = express.Router();

router
  .post("/add-student-upload", uploadStudentsByXLsFile)
  .post("/add-student", addStudent)
  .post("/find-name", autocompleteFindStudent)
  .post("/find-g-name", autocompleteFindGuardian)
  .get("/findId", findStudent)
  .post("/find-guardian", findGuardian)
  .get("/class-view", filterByClass)
  .get("/students", fetchStudents)
  .get("/get-view", printPreview)
  .get("/delete", deleteStudent)
  .post("/save-edit", updateStudentInfo)
  .post("/promote", promoteStudents)
  .post("/delete-multiple", deleteMultipleStudents)
  .post("/update-multiple", updateMultipleStudents);
module.exports = router;
