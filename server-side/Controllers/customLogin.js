const mysql = require("mysql");

// importing connectivity to mysql database
const conn = require("../connections/conn");

// importing custom mysql modules.
const dbQueries = require("../connections/mysqlApi");

// initialization with the connection as a parameter
const db = new dbQueries(conn);

// custom modules to log out where an error has occur and the line.
const logErr = require("../connections/logErrors");
const logToFile = require("../connections/logToFile");

const customLogin = (req, res) => {
  let { school_name } = req.query;
  let schoolFormatted = school_name.replace(/-/g, " ");

  db.getByColumnName("school", schoolFormatted, "school_cred")
    .then((data) => {
      if (data.length > 0) {
        let response = {};
        response.logo = data[0].logo;
        db.getAll(`${schoolFormatted.replace(/ /g, "_")}_settings`)
          .then((data) => {
            if (data.length > 0) {
              response.theme = data[0].themes;
              // console.log(response);
              return res.json({
                status: true,
                response: response,
              });
            } else {
              return res.json({
                status: false,
                message: "No theme",
              });
            }
          })
          .catch((err) => {
            console.log(err);
            logToFile(err);
            logErr(
              err,
              __filename,
              new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
            );
            return res.json({
              status: false,
              message:
                "Something went wrong while trying to fetch theme" +
                schoolFormatted,
            });
          });
      } else {
        logToFile("Error trying to fetch school.", school_name);
        return res.json({
          status: false,
          message: "No school exist with the name" + schoolFormatted,
        });
      }
    })
    .catch((err) => {
      logToFile(err);
      logErr(
        err,
        __filename,
        new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
      );
      return res.json({
        status: false,
        message: "Something went wrong. Try again" + schoolFormatted,
      });
    });
};
module.exports = customLogin;
