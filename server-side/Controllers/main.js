const conn = require("../connections/conn"); // connection module made to apache server
const dbQueries = require("../connections/mysqlApi"); // mysql api module
const db = new dbQueries(conn);
require("../connections/prototypes");
const logErr = require("../connections/logErrors");
let admin = "";

const scheduler = require("./scheduler");
const logToFile = require("../connections/logToFile");
const mysql = require("mysql");

function checkAdmin(req, res, next) {
  if (req?.session?.user?.admin) next();
  else {
    console.log("not allowed");
    res.redirect(301, "/authorization");
  }
}
function checkAuth(req, res, next) {
  if (req?.session?.user) next();
  else {
    console.log("not logged in");
    res.redirect("/");
  }
}

const getSchoolInfo = (req, res) => {
  if (req?.session?.user?.school) {
    db.query(
      `SELECT admin, custom_login FROM school_cred WHERE school = ${mysql.escape(
        req?.session?.user?.school
      )} AND admin = ${mysql.escape(req?.session?.user?.user)}`
    )
      .then((data) => {
        req.session.user.customLogin = "";

        if (data.length > 0) {
          admin = true;
          req.session.user.customLogin = data[0].custom_login;
          req.session.user.admin = admin;
          res.json({
            status: true,
            creds: req?.session?.user,
          });
        } else {
          admin = false;

          db.getByColumnName("school", req.session.user.school, "school_cred")
            .then((data2) => {
              if (data2.length > 0) {
                req.session.user.customLogin = data2[0].custom_login;
                req.session.user.admin = admin;
                res.json({
                  status: true,
                  creds: req?.session?.user,
                });
              }
            })
            .catch((err1) => {
              logToFile(
                "Error" + err1,
                req?.session?.user?.user + " " + req.session.user.school
              );
              logErr(
                err1,
                __filename,
                new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
              );
              res.json({
                status: "something",
                message: "Try again or refresh server",
              });
            });
        }
      })
      .catch((err) => {
        logToFile(
          "Error" + err,
          req?.session?.user?.user + " " + req.session.user.school
        );
        logErr(
          err,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        res.json({
          status: "something",
          message: "Try again or refresh server",
        });
      });

    scheduler(db, req);
  } else {
    console.log("session", req?.session?.user?.school);
    res.json({
      status: false,
      message: "Not logged in",
    });
  }
};

const getLogo = (req, res) => {
  if (req?.session?.user?.school) {
    db.query(
      `SELECT logo FROM school_cred WHERE school = ${mysql.escape(
        req?.session?.user?.school
      )}`
    )
      .then((data) => {
        buff = data[0].logo;
        if (buff) {
          res.json({
            status: true,
            image: buff,
          });
        }
      })
      .catch((err) => {
        logToFile(
          "Error fetching image" + err,
          req?.session?.user?.user + " " + req.session.user.school
        );
        logErr(
          err,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        res.json({
          status: "something",
          message: "Try again or refresh server",
        });
      });

    scheduler(db, req);
  } else {
    console.log("session", req?.session?.user?.school);
    res.json({
      status: false,
      message: "Not logged in",
    });
  }
};
module.exports = {
  checkAdmin,
  checkAuth,
  getSchoolInfo,
  getLogo,
};
