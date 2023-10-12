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

const fetchUsers = (req, res) => {
  // using method getAll from custom mysql module importede
  db.getAll(`${req?.session?.databaseName}_users`)
    .then((data) => {
      return res.json({
        status: true,
        data,
      });
    })
    .catch((err) => {
      logErr(
        err,
        __filename,
        new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
      );
      res.json({
        status: false,
        message: "something went wrong. Try refreshing or restarting",
      });
    });
};
const createUser = (req, res) => {
  // destructure variables from req.body object
  let { username, pass, loggedSchool } = req.body;

  // set variables to lowerCase()
  username = username?.toLowerCase()?.trim();
  loggedSchool = loggedSchool?.toLowerCase()?.trim();
  pass = pass.toLowerCase()?.trim();

  // check database if user already exist
  db.getByColumnName(
    "user",
    `${username}`,
    `${req?.session?.databaseName}_users`
  )
    .then((data) => {
      // return error to frontend if user already exist.
      if (data.length !== 0) {
        return res.json({
          status: false,
          message: "Username already exist. Try a different name",
        });
      }
    })
    .catch((err) => {
      console.log(err);
      logToFile(err, req.session.user.user + " " + req.session.user.school);
      logErr(
        err,
        __filename,
        new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
      );
      res.json({
        status: false,
        message: "something went wrong. Try refreshing or restarting",
      });
    });

  // if user does not already exist, insert credentials to the database.
  if (username && pass) {
    db.insert(`${req?.session?.databaseName}_users`, {
      school: loggedSchool.toLowerCase(),
      user: username.toLowerCase(),
      password: pass.toLowerCase(),
      status: 1,
    })
      .then((data) => {
        logToFile(
          "A sub user was created",
          req.session.user.user + " " + req.session.user.school
        );
        res.json({ status: true, message: "opertion succesful" });
      })
      .catch((err) => {
        console.log(err);
        logToFile(err, req.session.user.user + " " + req.session.user.school);
        logErr(
          err,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        res.json({
          status: false,
          message: "something went wrong. Try refreshing or restarting",
        });
      });
  }
};
const editUser = (req, res) => {
  let { id, status } = req.body;

  db.query(
    `UPDATE ${req?.session?.databaseName}_users SET status = ${mysql.escape(
      status
    )} WHERE id = ${id}`
  )
    .then((data) => res.json({ status: true, message: "opertion succesful" }))
    .catch((err) => {
      console.log(err);
      logToFile(err, req.session.user.user + " " + req.session.user.school);
      logErr(
        err,
        __filename,
        new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
      );
      res.json({
        status: false,
        message: "something went wrong. Try refreshing or restarting",
      });
    });
};
const deleteUser = (req, res) => {
  let { id } = req.body;
  if (id) {
    db.delete(`${req?.session?.databaseName}_users`, parseInt(id))
      .then((data) =>
        res.json({ status: true, message: "operation succesful" })
      )
      .catch((err) => {
        console.log(err);
        logToFile(err, req.session.user.user + " " + req.session.user.school);
        logErr(
          err,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        res.json({
          status: false,
          message: "something went wrong. Try refreshing or restarting",
        });
      });
  }
};

const makeUserAdmin = (req, res) => {
  let { id } = req.body;
  if (id) {
    db.getById(id, `${req?.session?.databaseName}_users`)
      .then((data) => {
        if (data.length > 0) {
          db.query(
            `SELECT * FROM school_cred WHERE admin = ${mysql.escape(
              data[0].user
            )} AND password = ${mysql.escape(data[0].password)}`
          )
            .then((data3) => {
              if (data3.length === 0) {
                db.insert(`school_cred`, {
                  school: data[0].school,
                  admin: data[0].user,
                  password: data[0].password,
                })
                  .then((data2) => {
                    logToFile(
                      "A user was made an admin",
                      req.session.user.user + " " + req.session.user.school
                    );

                    return res.json({
                      status: true,
                      message: "Operation Succesful",
                    });
                  })
                  .catch((err) => {
                    console.log(err);
                    logToFile(
                      err,
                      req.session.user.user + " " + req.session.user.school
                    );
                    logErr(
                      err,
                      __filename,
                      new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
                    );
                    res.json({
                      status: false,
                      message:
                        "something went wrong. Try refreshing or restarting",
                    });
                  });
              } else {
                res.json({
                  status: false,
                  message: "Already an admin",
                });
              }
            })
            .catch((err2) => {
              console.log(err2);
              logToFile(
                err2,
                req.session.user.user + " " + req.session.user.school
              );
              logErr(
                err2,
                __filename,
                new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
              );
              res.json({
                status: false,
                message: "something went wrong. Try refreshing or restarting",
              });
            });
        }
      })
      .catch((error) => {
        console.log(error);
        logToFile(error, req.session.user.user + " " + req.session.user.school);
        logErr(
          error,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        res.json({
          status: false,
          message: "something went wrong. Try refreshing or restarting",
        });
      });
  }
};
module.exports = {
  fetchUsers,
  createUser,
  editUser,
  deleteUser,
  makeUserAdmin,
};
