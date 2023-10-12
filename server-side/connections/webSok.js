const logToFile = require("./logToFile");
const dbQueries = require("./mysqlApi");
const mysql = require("mysql");
let WebSok = (io, conn) => {
  try {
    const db = new dbQueries(conn);

    let select = null;
    io.on("connection", (socket) => {
      // conn.query("")
      socket.on("get-notification", ({ loggedSchool, loggedUser }) => {
        if (loggedSchool) {
          loggedSchool = loggedSchool.replace(/ /g, "_") || "";
          try {
            conn.query(
              `SHOW TABLES LIKE '${loggedSchool}_notifications'`,
              (err, data) => {
                if (err) {
                  console.log(err);
                  logToFile(err, loggedSchool + " " + loggedUser);
                }
                if (data.length !== 0) {
                  conn.query(
                    `SELECT COUNT(*) AS count FROM ${loggedSchool}_notifications WHERE status = 0`,
                    (err, data) => {
                      if (err) {
                        console.log(err);
                        logToFile(err, loggedSchool + " " + loggedUser);
                      }
                      select = data;
                    }
                  );
                } else return;
              }
            );
          } catch (error) {
            console.log("Error getting notifications");
            logToFile(
              "Error getting notifications",
              loggedSchool + " " + loggedUser
            );
          }
          if (select) {
            io.emit("notification", select);
          }
        }
      });

      socket.on("display_notification", (data) => {
        let message;
        if (data.type === "part")
          message = `${data.name
            .split(" ")
            .map((name) => name.charAt(0).toUpperCase() + name.slice(1))
            .join(" ")} made a part payment of  ${
            data.amount_paid
          } with payment id: ${data.payment_id}`;
        else if (data.type === "cleared")
          message = `${data.name
            .split(" ")
            .map((name) => name.charAt(0).toUpperCase() + name.slice(1))
            .join(" ")} has cleared their outstanding payment with ID number ${
            data.payment_id
          }`;
        else
          message = `${data.name
            .split(" ")
            .map((name) => name.charAt(0).toUpperCase() + name.slice(1))
            .join(" ")} made a payment with ID number ${data.payment_id}`;

        socket.broadcast.emit("show_notification", {
          id: Math.round(Math.random() / 2),
          message,
        });
      });
      socket.on(
        "check_any_payment",
        ({ name, loggedSchool, term, session, loggedUser, classes }) => {
          try {
            loggedSchool = loggedSchool.replace(/ /g, "_") || "";
            try {
              if (name && loggedSchool && term && session) {
                conn.query(
                  `SELECT name, class, balance, payment_id, keyid, payment_for, SUM(amount_paid) AS total, term, session FROM ${loggedSchool}_payment_record WHERE (payment_for LIKE '%fees%' OR payment_for LIKE '%busfare%' OR payment_for = 'pta') AND name = ${mysql.escape(
                    name
                  )} AND term = ${mysql.escape(
                    term?.toLowerCase()
                  )} AND session = ${mysql.escape(
                    session
                  )} AND class = ${mysql.escape(classes)} GROUP BY keyid`,
                  (err, data) => {
                    if (err) {
                      console.log(err);
                      logToFile(err, loggedSchool + " " + loggedUser);
                    }
                    if (data.length > 0) {
                      socket.emit("return_any_fee", {
                        data: data,
                      });
                    }
                  }
                );
              }
            } catch (error) {
              logToFile(error, loggedSchool + " " + loggedUser);
              logErr(
                error,
                __filename,
                new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
              );
            }
          } catch (error) {
            logToFile(error, loggedSchool + " " + loggedUser);
            logErr(
              error,
              __filename,
              new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
            );
          }
        }
      );
      socket.on("check_balance", ({ name, loggedSchool, loggedUser }) => {
        loggedSchool = loggedSchool.replace(/ /g, "_") || "";
        try {
          if (name && loggedSchool) {
            conn.query(
              `SELECT name, class, balance, payment_id, keyid, SUM(amount_paid) AS total, term, session FROM ${loggedSchool}_payment_record WHERE name = ${mysql.escape(
                name
              )} AND balance > 0 GROUP BY keyid`,
              (err, data) => {
                if (err) {
                  console.log(err);
                  logToFile(err, loggedSchool + " " + loggedUser);
                }
                if (data.length > 0) {
                  socket.emit("return_balance", {
                    data: [...data],
                  });
                }
              }
            );
          }
        } catch (error) {
          logToFile(error, loggedSchool + " " + loggedUser);
          logErr(
            error,
            __filename,
            new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
          );
        }
      });
      socket.on("get-admission-no", ({ loggedSchool }) => {
        if (loggedSchool) {
          loggedSchool = loggedSchool.replace(/ /g, "_") || "";
          try {
            db.getById(1, `${loggedSchool}_settings`)
              .then((data) => {
                socket.emit("set-admission-no", { data: data[0].last_adm_no });
                socket.broadcast.emit("set-admission-no", {
                  data: data[0].last_adm_no,
                });
              })
              .catch((err) => console.log(err));
          } catch (error) {
            logToFile(error, loggedSchool + " " + loggedUser);
            logErr(
              error,
              __filename,
              new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
            );
          }
        }
      });
      socket.on("disconnect", (user) => {});
    });
  } catch (error) {
    logToFile(error, loggedSchool + " " + loggedUser);
    logErr(
      error,
      __filename,
      new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
    );
  }
};

module.exports = WebSok;
