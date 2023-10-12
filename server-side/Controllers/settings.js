const conn = require("../connections/conn"); // connection module made to apache server
const dbQueries = require("../connections/mysqlApi"); // mysql api module
const db = new dbQueries(conn);
const logErr = require("../connections/logErrors");
const mysqldump = require("mysqldump");
const path = require("path");
const { exec } = require("child_process");
require("../connections/prototypes");
const multer = require("multer");
const logToFile = require("../connections/logToFile");
const storage = multer.memoryStorage();

const upload = multer({ storage: storage });
const mysql = require("mysql");

const fetchAllSettingsData = (req, res) => {
  if (req?.session?.user) {
    db.getAll(`${req?.session?.databaseName}_settings`)
      .then((data) => {
        res.json({
          status: true,
          message: [data[0]],
        });
      })
      .catch((err) => {
        console.log(err);
        logToFile(
          err,
          req?.session?.user?.user + " " + req.session.user.school
        );
        logErr(
          err,
          __filename,
          new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
        );
        res.json({
          status: false,
          message: "something went wrong. Try again",
        });
      });
  } else {
    res.json({
      status: false,
      message: "Not logged in",
    });
  }
};
const uploadLogo = (req, res) => {
  const data = req.file.buffer;

  let connection = db.returnConnection();

  connection.query(
    `UPDATE school_cred SET logo = ? WHERE school = ${mysql.escape(
      req?.session?.user?.school
    )} AND admin = ${mysql.escape(req?.session?.user?.user)}`,
    [data],
    (err, result) => {
      if (err) {
        console.log(err);
        logToFile(
          err,
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: false,
          message: "Something went wrong. Try refreshing page.",
        });
      } else {
        logToFile(
          "Image Uploaded succesfully",
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: true,
          message: "Image uploaded succesfully",
        });
      }
    }
  );
};
const editCurrentSession = (req, res) => {
  if (req?.session?.user) {
    let { value } = req.body;
    if (value) {
      db.updateByColumnName(
        "current_session",
        value,
        `${req?.session?.databaseName}_settings`
      )
        .then((data) => {
          logToFile(
            "Edited current session",
            req.session.user.user + " " + req.session.user.school
          );

          res.json({
            status: true,
            message: "Operation successful",
          });
        })
        .catch((err) => {
          console.log(err);
          logToFile(
            err,
            req?.session?.user?.user + " " + req.session.user.school
          );
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
  }
};
const editCurrentTerm = (req, res) => {
  if (req?.session?.user) {
    let { value } = req.body;
    if (value) {
      db.updateByColumnName(
        "current_term",
        value?.trim()?.toLowerCase(),
        `${req?.session?.databaseName}_settings`
      )
        .then((data) => {
          logToFile(
            "Edited current term",
            req.session.user.user + " " + req.session.user.school
          );

          res.json({
            status: true,
            message: "Operation successful",
          });
        })
        .catch((err) => {
          console.log(err);
          logToFile(
            err,
            req?.session?.user?.user + " " + req.session.user.school
          );
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
  }
};
const saveDataToDatabase = (req, res) => {
  if (req?.session?.user?.school) {
    let { data, name } = req.body;
    let newdata;
    if (data) {
      if (
        name == "sessions" ||
        name == "terms" ||
        name == "payment_for" ||
        name == "payment_method"
      ) {
        newdata = data.join(",").toLowerCase();
      } else {
        newdata = JSON.stringify(data);
      }
      newdata &&
        db
          .updateByColumnName(
            name,
            `${newdata}`,
            `${req?.session?.databaseName}_settings`
          )
          .then((response) => {
            return res.json({
              status: true,
              message: "Operation succesful",
            });
          })
          .catch((err) => {
            console.log(err);
            logToFile(
              err,
              req?.session?.user?.user + " " + req.session.user.school
            );
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
  } else {
    res.json({
      status: false,
      message: "not logged in",
    });
  }
};
const updateClass = (req, res) => {
  let { prev, newCls, classes, fees } = req?.body;
  if ((prev && newCls, classes)) {
    classes = JSON.stringify(classes.map((classe) => classe.toLowerCase()));
    fees = JSON.stringify(fees);
    db.query(
      `UPDATE ${
        req?.session?.databaseName
      }_payment_record SET class = ${mysql.escape(
        newCls?.toLowerCase()
      )} WHERE class = ${mysql.escape(prev?.toLowerCase())}`
    )
      .then((data) => {
        db.query(
          `UPDATE ${
            req?.session?.databaseName
          }_students SET class = ${mysql.escape(
            newCls?.toLowerCase()
          )} WHERE class = ${mysql.escape(prev?.toLowerCase())}`
        )
          .then((data) => {
            db.updateByColumnName(
              "classes",
              `${classes}`,
              `${req?.session?.databaseName}_settings`
            )
              .then((data) => {
                logToFile(
                  "Edited class",
                  req.session.user.user + " " + req.session.user.school
                );

                res.json({
                  status: true,
                  message: "Edit Succesful",
                });
              })
              .catch((err) => {
                console.log(err);
                logToFile(
                  err,
                  req?.session?.user?.user + " " + req.session.user.school
                );
                return res.json({
                  status: false,
                  message: "Something went wrong. Try refreshing",
                });
              });
          })
          .catch((err) => {
            console.log(err);
            logToFile(
              err,
              req?.session?.user?.user + " " + req.session.user.school
            );
          });
      })
      .catch((err) => {
        console.log(err);
        logToFile(
          err,
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: false,
          message: "Something went wrong. Try refreshing",
        });
      });
  }
};
const configureBackup = (req, res) => {
  let command = `cd ${path.join(
    __dirname,
    "/backups"
  )} && touch backup_database.sql`;
  exec(command);
  mysqldump({
    connection: {
      host: "localhost",
      user: "root",
      password: "",
      port: "3306",
      database: "paymof",
    },
    dumpToFile: `${path.join(__dirname, '../', "/backups/")}backup_database.sql`,
  });
  db.updateByColumnName(
    "backup_date",
    `${new Date(Date.now())}`,
    `${req?.session?.databaseName}_settings`
  )
    .then((data) => {
      logToFile(
        "Bakup succesful",
        req.session.user.user + " " + req.session.user.school
      );

      res.json({
        status: true,
        message: "Backup Succesful",
      });
    })
    .catch((err) => {
      console.log(err);
      logToFile(err, req?.session?.user?.user + " " + req.session.user.school);
      return res.json({
        status: false,
        message: "Something went wrong. Try refreshing",
      });
    });
};
const backupHistory = (req, res) => {
  db.query(
    `SELECT backup_date FROM ${req?.session?.databaseName}_settings WHERE id = 1`
  )
    .then((data) => {
      return res.json({
        status: true,
        message: data,
      });
    })
    .catch((err) => {
      console.log(err);
      logToFile(err, req?.session?.user?.user + " " + req.session.user.school);
      return res.json({
        status: false,
        message: "Something went wrong. Try refreshing",
      });
    });
};
const autoImportClasses = async (req, res) => {
  let data;
  let prevClasses;
  let prevFees;
  let classes;
  let newClass = [];
  let newFee = [];
  try {
    data = await db.getAll(`${req?.session?.databaseName}_settings`);
    prevClasses = JSON.parse(data[0].classes);
    prevFees = JSON.parse(data[0].fees);
    classes = await db.query(
      `SELECT DISTINCT class FROM ${req?.session?.databaseName}_students`
    );
    newClass = [...prevClasses];
    newFee = [...prevFees];
    prevFees = new Map(prevFees);
    classes.map((clas) => {
      let fee = 0;
      let feeLesson = 0;
      let feePta = 0;
      newClass.push(clas.class?.toLowerCase());
      if (prevFees.has(clas.class)) fee = prevFees.get(clas.class);
      if (prevFees.has(clas.class + " lesson"))
        feeLesson = prevFees.get(clas.class + " lesson");
      if (prevFees.has(clas.class + " pta"))
        feePta = prevFees.get(clas.class + " pta");
      newFee.push([clas.class?.toLowerCase(), fee]);
      newFee.push([clas.class?.toLowerCase() + " lesson", feeLesson]);
      newFee.push([clas.class?.toLowerCase() + " pta", feePta]);
    });
    newClass = [
      ...new Set(newClass?.map((classes) => classes?.trim()?.toLowerCase())),
    ];
    newFee = new Map(newFee);
    newFee = JSON.stringify([...newFee]);
    newClass = JSON.stringify(newClass);
    db.query(
      `UPDATE ${
        req?.session?.databaseName
      }_settings SET classes = ${mysql.escape(newClass)}, fees = ${mysql.escape(
        newFee
      )} WHERE id = 1`
    )
      .then((data) => {
        logToFile(
          "Class was auto Imported ",
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
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: false,
          message: "Failed to auto import class",
          error: err,
        });
      });
  } catch (error) {
    console.log(error);
    logToFile(error, req?.session?.user?.user + " " + req.session.user.school);
    return res.json({
      status: false,
      message: "Failed to auto import class",
      error: error,
    });
  }
};
const saveFeeToHistory = async (req, res) => {
  let { fees, current_session, current_term } = req.body;
  try {
    let checkDb = await db.query(
      `SELECT id FROM ${
        req?.session?.databaseName
      }_settings WHERE session_history = ${mysql.escape(
        current_session
      )} AND term_history = ${mysql.escape(current_term)}`
    );
    if (checkDb.length > 0) {
      let id = checkDb[0].id;
      db.query(
        `UPDATE ${
          req?.session?.databaseName
        }_settings SET fee_history = ${mysql.escape(
          JSON.stringify(fees)
        )}, session_history = ${mysql.escape(
          current_session
        )}, term_history = ${mysql.escape(
          current_term?.toLowerCase().trim()
        )} WHERE id = ${id}`
      )
        .then((data) => {
          logToFile(
            "Fee was updated into history ",
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
            req?.session?.user?.user + " " + req.session.user.school
          );
          return res.json({
            status: false,
            message: "Failed to save fee into history",
            error: err,
          });
        });
    } else {
      db.insert(`${req?.session?.databaseName}_settings`, {
        fee_history: JSON.stringify(fees),
        session_history: current_session,
        term_history: current_term?.trim().toLowerCase(),
      })
        .then((data) => {
          logToFile(
            "Fee was added to history ",
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
            req?.session?.user?.user + " " + req.session.user.school
          );
          return res.json({
            status: false,
            message: "Failed to save fee into history",
            error: err,
          });
        });
    }
  } catch (error) {
    console.log(error);
    logToFile(error, req?.session?.user?.user + " " + req.session.user.school);
    return res.json({
      status: false,
      message: "Failed to save fee into history",
      error: error,
    });
  }
};

module.exports = {
  fetchAllSettingsData,
  upload,
  uploadLogo,
  editCurrentSession,
  editCurrentTerm,
  saveDataToDatabase,
  updateClass,
  configureBackup,
  backupHistory,
  autoImportClasses,
  saveFeeToHistory,
};
