const conn = require("../connections/conn"); // connection module made to apache server
const dbQueries = require("../connections/mysqlApi"); // mysql api module
const db = new dbQueries(conn);
const createTables = require("../connections/sqlHelper");
const logErr = require("../connections/logErrors");
const logToFile = require("../connections/logToFile");

const createSchool = (req, res) => {
  let { school_name } = req.query;
  school_name ? (school_name = school_name.replace(/-/g, " ")) : "";
  if (school_name) {
    db.query("SHOW TABLES LIKE 'school_cred'")
      .then((response) => {
        if (response.length != 0) {
          db.getByColumnName("school", `${school_name}`, "school_cred")
            .then((data) => {
              if (data.length !== 0) {
                res.json({
                  status: true,
                  message: "School Already Exist",
                });
              } else {
                createTables(school_name);
                res.status(200);
                res.json({
                  status: false,
                  message: "",
                });
              }
            })
            .catch((err) => {
              logErr(
                err,
                __filename,
                new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
              );
              res.json({
                status: true,
                message: "something went wrong. Try refreshing or restarting",
              });
            });
        } else {
          db.query(
            `CREATE TABLE school_cred (id INT AUTO_INCREMENT PRIMARY KEY, school VARCHAR(50) NOT NULL, admin VARCHAR(50) NOT NULL, status VARCHAR(20) NOT NULL, date_of_pay VARCHAR(50) NOT NULL, date_of_expiry VARCHAR(50) NOT NULL, password VARCHAR(50) NOT NULL, phone VARCHAR(50) NOT NULL, email VARCHAR(50) NOT NULL, custom_login VARCHAR(50) NOT NULL, logo LONGBLOB NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)`
          )
            .then((response) => {
              createTables(school_name);
              res.status(200);
              logToFile("Register school " + school_name + "succesfully");
              res.json({
                status: false,
                message: "",
              });
            })
            .catch((err) => {
              logToFile(err, school_name);
              logErr(
                err,
                __filename,
                new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
              );
              res.json({
                status: true,
                message: "something went wrong. Try refreshing or restarting",
              });
            });
        }
      })
      .catch((error) => {
        logToFile(error, school_name);
        logErr(
          err,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        res.json({
          status: true,
          message: "something went wrong. Try refreshing or restarting",
        });
      });
  } else {
    res.status(403);
    res.json({
      status: true,
      message: "There was an error while getting name",
    });
  }
};
const registerAdmintoSchool = (req, res) => {
  let { adminName, adminCode, schoolName, email, phone, customLogin } =
    req.body;
  if (adminName !== "" || adminCode !== "" || email !== "" || phone !== "") {
    db.insert("school_cred", {
      school: schoolName.toLowerCase(),
      admin: adminName.toLowerCase(),
      password: adminCode.toLowerCase(),
      email: email.toLowerCase(),
      phone: phone,
      custom_login: customLogin === false ? "" : customLogin.toLowerCase(),
    })
      .then((response) => {
        let newScl = `${schoolName.toLowerCase().replace(/ /g, "_")}`;
        db.insert(`${newScl}_users`, {
          school: schoolName.toLowerCase(),
          user: adminName.toLowerCase(),
          password: adminCode.toLowerCase(),
          status: 1,
        });
        logToFile(`Admin for ${schoolName} created`);
        res.json({ status: false, message: "Registration Successful" });
      })
      .catch((err) => {
        logErr(
          err,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        res.status(503);
        res.json({
          status: true,
          message: "Registration failed. Try again later...",
        });
      });
  }
};

module.exports = {
  createSchool,
  registerAdmintoSchool,
};
