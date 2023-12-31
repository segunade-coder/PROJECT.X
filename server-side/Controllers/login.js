// importing connectivity to mysql database
const conn = require("../connections/conn");

// importing custom mysql modules.
const dbQueries = require("../connections/mysqlApi");

// initialization with the connection as a parameter
const db = new dbQueries(conn);

// custom modules to log out where an error has occur and the line.
const logErr = require("../connections/logErrors");

const logToFile = require("../connections/logToFile");
const mysql = require("mysql");

const findAllSchools = (req, res) => {
  db.query("SELECT * FROM school_cred GROUP BY school")
    .then((data) => {
      let schoolArr = [];
      if (data.length !== 0) {
        data.forEach((element) => schoolArr.push({ school: element.school }));
        return res.json({
          status: true,
          error: false,
          school: schoolArr,
        });
      } else {
        return res.json({
          error: false,
          status: false,
          message: "no school yet",
        });
      }
    })
    .catch((err) => {
      logErr(
        err,
        __filename,
        new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
      );
      return res.json({
        error: false,
        status: false,
        message: "no school yet",
      });
    });
};

const validateLoginCredentials = (req, res) => {
  // destructuring variables from req.body object
  let { school, user, pass } = req.body;

  let req_status = false;
  // create a variable "active" to validate account is active or not
  let active = false;

  // check if variables are not empty
  if (school !== "" && user !== "" && pass !== "") {
    // using regular expression to convert all spaces in the school string to "_"

    let newScl = `${school.toLowerCase().replace(/ /g, "_")}`;

    // convert to lower case
    school = school?.toLowerCase();
    user = user?.toLowerCase();
    pass = pass?.toLowerCase();

    // fetch user where username and school name is equal to the credentials presented by frontend from database
    db.query(
      `SELECT school, user, password, status FROM ${newScl}_users  WHERE school = ${mysql.escape(
        school
      )} AND user = ${mysql.escape(user)}`
    )
      .then((response) => {
        // check if response has any value in it
        if (response.length > 0) {
          // for each loop to check response against the credentials presented by the frontend

          response.forEach((element) => {
            let { password, status } = element;

            // check password if it correspond to the response from the database and set req_status to true

            if (password === pass) req_status = true;
            else req_status = false;

            // check if account is active and set active to true
            if (status == 1) active = true;
            else active = false;
          });

          if (req_status) {
            if (active) {
              // set user credentials to session
              req.session.user = {
                school,
                user,
                admin: false,
              };

              // set ddatabase name to session for easy access
              req.session.databaseName = school.replace(/ /g, "_");

              // return response to frontend
              logToFile(
                "Login succesful",
                req?.session?.user?.user + " " + req.session.user.school
              );
              return res.json({
                error: false,
                message: "Successful login",
              });
            } else {
              // return inactive if account is inactive.
              logToFile("Account inactive", user + " " + school);

              return res.json({
                error: true,
                message: "Your account is inactive",
              });
            }
          }

          // return invalid password if password does not correspond
          logToFile("Invalid password", user + " " + school);

          return res.json({
            error: true,
            message: "Invalid password",
          });
        } else {
          // return invalid username if no user with the credentials on the database
          logToFile("Invalid username", user + " " + school);

          return res.json({
            error: true,
            message: "Invalid username",
          });
        }
      })
      .catch((err) => {
        logErr(
          err,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        logToFile(err, user + " " + school);

        return res.json({
          error: true,
          message: "Something went wrong, try again.",
        });
      });
  } else {
    // if any variable is empty, return error to frontend
    return res.json({
      error: true,
      message: "Fill in all fields",
    });
  }
};

module.exports = {
  findAllSchools,
  validateLoginCredentials,
};
