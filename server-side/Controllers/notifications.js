const conn = require("../connections/conn"); // connection module made to apache server
const dbQueries = require("../connections/mysqlApi"); // mysql api module
const db = new dbQueries(conn);
require("../connections/prototypes");
const logToFile = require("../connections/logToFile");

const fetchNotifications = (req, res) => {
  db.query(
    `SELECT * FROM ${req?.session?.databaseName}_notifications ORDER BY id DESC`
  )
    .then((data) => {
      setTimeout(() => {
        db.query(
          `UPDATE ${req?.session?.databaseName}_notifications SET status = 1 WHERE status = 0`
        )
          .then()
          .catch((err) => {
            console.log(err);
          });
      }, 2000);
      res.json({
        status: true,
        message: data,
      });
    })
    .catch((err) => {
      console.log(err);
      logToFile(err, req?.session?.user?.user + " " + req.session.user.school);
      return res.json({
        status: false,
        message: "Something went wrong. Try refreshing.",
      });
    });
};
const deleteNotification = (req, res) => {
  let { id } = req.query;
  if (id) {
    db.query(
      `DELETE FROM ${req?.session?.databaseName}_notifications WHERE id = ${id}`
    )
      .then((data) => {
        logToFile(
          "A notification was deleted",
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: true,
          message: "Notification deleted succesfully",
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
module.exports = {
  fetchNotifications,
  deleteNotification,
};
