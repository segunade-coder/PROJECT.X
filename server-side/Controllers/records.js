const conn = require("../connections/conn"); // connection module made to apache server
const dbQueries = require("../connections/mysqlApi"); // mysql api module
const db = new dbQueries(conn);
require("../connections/prototypes");
const logErr = require("../connections/logErrors");
const logToFile = require("../connections/logToFile");
const mysql = require("mysql");

const autoCompleteName = (req, res) => {
  let { name, condition } = req.body;
  if (!condition) {
    if (req?.session?.user) {
      db.query(
        `SELECT * FROM ${
          req?.session?.databaseName
        }_payment_record WHERE (name LIKE ${mysql.escape(
          `%${name.toLowerCase()}%`
        )} OR payment_id LIKE ${mysql.escape(
          `%${name.toLowerCase()}%`
        )}) GROUP BY keyid ORDER BY class`
      )
        .then((data) =>
          res.json({
            status: true,
            message: data,
          })
        )
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
    } else {
      res.json({
        status: false,
        message: "Not logged in",
      });
    }
  } else {
    let { filterArray } = req.body;
    let sqlqry = [];
    let sqlstring = "";
    for (filter of filterArray) {
      for (let key in filter) {
        sqlqry.push(
          `${key} LIKE ${mysql.escape(`%${filter[key].trim().toLowerCase()}%`)}`
        );
        sqlqry.push("AND");
      }
    }
    if (sqlqry[sqlqry.length - 1] == "AND") sqlqry.pop();
    sqlstring = sqlqry.join(" ");
    if (sqlstring) {
      let qry = `SELECT id, name, class FROM ${
        req?.session?.databaseName
      }_payment_record WHERE (name LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )} OR payment_id LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )}) AND ${sqlstring} GROUP BY keyid ORDER BY class`;
      db.query(qry)
        .then((data) => {
          res.json({
            status: true,
            message: data,
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
    }
  }
};

const findSearchRecord = (req, res) => {
  let { status, name, searchId, limit, page } = req.body;
  const offset = (page - 1) * limit;
  let total = 0;
  if (status) {
    db.query(
      `SELECT COUNT(*) as total FROM ${
        req?.session?.databaseName
      }_payment_record WHERE payment_id = ${mysql.escape(
        searchId
      )} GROUP BY keyid ORDER BY created_at`
    )
      .then((data) => (total = data.length))
      .catch((err) => console.log(err));
    db.query(
      `SELECT *, SUM(amount_paid) AS TotalPaid FROM ${
        req?.session?.databaseName
      }_payment_record WHERE payment_id = ${mysql.escape(
        searchId
      )} GROUP BY keyid ORDER BY created_at LIMIT ${limit} OFFSET ${offset}`
    )
      .then((data) => {
        if (data) {
          res.json({
            status: true,
            message: data,
            total,
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
          status: false,
          message: "something went wrong. Try refreshing or restarting",
        });
      });
  } else {
    db.query(
      `SELECT COUNT(*) as total FROM ${
        req?.session?.databaseName
      }_payment_record WHERE (name LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )} OR payment_id = ${mysql.escape(
        name
      )}) GROUP BY keyid ORDER BY created_at`
    )
      .then((data) => {
        total = data?.length;
      })
      .catch((err) => console.log(err));
    db.query(
      `SELECT *, SUM(amount_paid) AS TotalPaid FROM ${
        req?.session?.databaseName
      }_payment_record WHERE (name LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )} OR payment_id = ${mysql.escape(
        name
      )}) GROUP BY keyid LIMIT ${limit} OFFSET ${offset}`
    )
      .then((data) => {
        if (data) {
          res.json({
            status: true,
            message: data,
            total,
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
          status: false,
          message: "something went wrong. Try refreshing or restarting",
        });
      });
  }
};

const fetchAllRecords = (req, res) => {
  let { limit, page } = req.body;
  const offset = (page - 1) * limit;
  let total = 0;
  db.query(
    `SELECT COUNT(*) as total FROM ${req?.session?.databaseName}_payment_record GROUP BY keyid`
  )
    .then((data) => (total = data.length))
    .catch((err) => console.log(err));
  db.query(
    `SELECT * FROM ${req?.session?.databaseName}_payment_record  GROUP BY keyid ORDER BY id LIMIT ${limit} OFFSET ${offset}`
  )
    .then((data) => {
      return res.json({
        status: true,
        message: data,
        total,
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
const printDisplay = (req, res) => {
  let { key } = req.query;
  if (key) {
    db.getByColumnName(
      `keyid`,
      key,
      `${req?.session?.databaseName}_payment_record`
    )
      .then((data) => {
        let name = data[0].name;
        let classe = data[0].class;

        db.query(
          `SELECT name, adm_no FROM ${
            req?.session?.databaseName
          }_students WHERE name = ${mysql.escape(
            name
          )} AND class = ${mysql.escape(classe)}`
        )
          .then((data2) => {
            let adm_no = "";
            if (data2.length > 0) {
              adm_no = data2[0]?.adm_no;
            }
            res.json({
              status: true,
              message: data,
              adm: adm_no,
            });
          })
          .catch((err) => {
            res.json({
              status: false,
              message: "Something went wrong. Try refreshing the page.",
            });
            console.log(err);
          });
      })
      .catch((err) => {
        res.json({
          status: false,
          message: "Something went wrong. Try refreshing the page.",
        });
        console.log(err);
      });
  }
};
const deleteRecord = (req, res) => {
  let { key } = req.query;
  if (key) {
    db.query(
      `DELETE FROM ${
        req?.session?.databaseName
      }_payment_record WHERE keyid = ${mysql.escape(key)}`
    )
      .then((data) => {
        logToFile(
          "A record was deleted with key" + key,
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: true,
          message: "Record deleted succesfully",
        });
      })
      .catch((err) => {
        console.log(err);
        return res.json({
          status: false,
          message: "Something went wrong. Try refreshing",
        });
      });
  }
};
const editRecord = (req, res) => {
  let { key, name, studentClass, total, balance, balanceDate, status } =
    req.body;
  if (
    key !== "" ||
    name !== "" ||
    studentClass !== "" ||
    total !== "" ||
    balance
  ) {
    if (status) {
      db.query(
        `UPDATE ${
          req?.session?.databaseName
        }_payment_record SET name = ${mysql.escape(
          name?.toLowerCase()
        )}, class = ${mysql.escape(
          studentClass?.toLowerCase()
        )}, expected_payment = ${total}, balance = ${balance}, balance_date  = ${mysql.escape(
          balanceDate
        )} WHERE keyid = ${mysql.escape(key)}`
      )
        .then((data) => {
          logToFile(
            "A record was edited with name " + name,
            req?.session?.user?.user + " " + req.session.user.school
          );
          return res.json({
            status: true,
            message: "Record edited succesfully",
          });
        })
        .catch((err) => {
          console.log(err);
          return res.json({
            status: false,
            message: "Something went wrong. Try refreshing",
          });
        });
    } else {
      db.query(
        `UPDATE ${
          req?.session?.databaseName
        }_payment_record SET name = ${mysql.escape(
          name
        )}, class = ${mysql.escape(
          studentClass
        )}, expected_payment = ${total}, balance = ${balance} WHERE keyid = ${mysql.escape(
          key
        )}`
      )
        .then((data) => {
          return res.json({
            status: true,
            message: "Record edited succesfully",
          });
        })
        .catch((err) => {
          console.log(err);
          return res.json({
            status: false,
            message: "Something went wrong. Try refreshing",
          });
        });
    }
  } else {
    res.json({
      status: false,
      message: "Fill in al field",
    });
  }
};
const findDebtors = (req, res) => {
  let { filteredClass, filteredSess, filteredTerm, sort } = req.body;
  if (sort === "") {
    return res.json({
      status: false,
      message: "Enter the necessaey fields",
    });
  } else {
    let conn = db.returnConnection();

    if (sort == "debtors") {
      if (filteredClass === "" || filteredTerm === "" || filteredSess === "") {
        return res.json({
          status: false,
          message: "Enter the necessaey fields",
        });
      } else {
        db.query(
          `SELECT * FROM ${
            req?.session?.databaseName
          }_payment_record WHERE (session = "${filteredSess?.trim()}" AND term = "${filteredTerm
            ?.trim()
            ?.toLowerCase()}"  AND class = "${filteredClass
            ?.trim()
            ?.toLowerCase()}" AND balance > 0 AND (payment_for LIKE '%fees%' OR payment_for = 'pta')) GROUP BY keyid ORDER BY created_at ASC`
        )
          .then((data) => {
            let names2 = [];
            if (data.length !== 0) {
              let names = data?.map((ind) => ind?.keyid);
              db.query(
                `SELECT name FROM ${
                  req?.session?.databaseName
                }_payment_record WHERE (session = "${filteredSess?.trim()}" AND term = "${filteredTerm
                  ?.toLowerCase()
                  ?.trim()}"  AND class = "${filteredClass
                  ?.toLowerCase()
                  ?.trim()}" AND (payment_for LIKE '%fees%' OR payment_for = 'pta')) GROUP BY keyid ORDER BY created_at ASC`
              ).then((data2) => {
                names2 = data2?.map((ind) => ind?.name);

                if (names2.length !== 0) {
                  conn.query(
                    `SELECT name, class, discounts, phone_number FROM ${req?.session?.databaseName}_students WHERE class = ? AND name NOT IN (?) AND status = ? AND discounts <> 'scholarship' ORDER BY name`,
                    [filteredClass?.toLowerCase()?.trim(), names2, "active"],
                    (err, restStudent) => {
                      if (err) {
                        console.log(err);
                        logToFile(
                          err,
                          req.session.user.user + " " + req.session.user.school
                        );
                      }
                      data?.push(...restStudent);
                    }
                  );
                }
                conn.query(
                  `SELECT COUNT(*) AS total FROM ${req?.session?.databaseName}_payment_record WHERE keyid IN (?) GROUP BY keyid ORDER BY created_at ASC`,
                  [names],
                  (err, totalArr) => {
                    if (err) {
                      console.log(err);
                      logToFile(
                        err,
                        req.session.user.user + " " + req.session.user.school
                      );
                    }
                    return res.json({
                      status: true,
                      message: data,
                      totalArr,
                    });
                  }
                );
              });
            } else {
              db.query(
                `SELECT * FROM ${
                  req?.session?.databaseName
                }_payment_record WHERE (session = "${filteredSess?.trim()}" AND term = "${filteredTerm
                  ?.toLowerCase()
                  ?.trim()}"  AND class = "${filteredClass
                  ?.toLowerCase()
                  ?.trim()}" AND (payment_for LIKE '%fees%' OR payment_for = 'pta')) GROUP BY keyid ORDER BY created_at ASC`
              )
                .then((data3) => {
                  let names = data3?.map((ind) => ind?.keyid);
                  let names3 = data3?.map((ind) => ind?.name);
                  // console.log(names3);
                  if (names3.length !== 0) {
                    console.log("There are stuent that have paid");
                    conn.query(
                      `SELECT name, class, discounts, phone_number FROM ${req?.session?.databaseName}_students WHERE name NOT IN (?) AND class = ? AND status = 'active'  AND discounts <> 'scholarship' ORDER BY name`,
                      [names3, filteredClass?.toLowerCase()?.trim()],
                      (err, restStud) => {
                        if (err) {
                          console.log(err);
                          logToFile(
                            err,
                            req.session.user.user +
                              " " +
                              req.session.user.school
                          );
                        }
                        data = [];
                        data?.push(...restStud);
                        conn.query(
                          `SELECT COUNT(*) AS total FROM ${req?.session?.databaseName}_payment_record WHERE keyid IN (?) GROUP BY keyid ORDER BY created_at ASC`,
                          [names],
                          (err, totalArr) => {
                            if (err) {
                              console.log(err);
                              logToFile(
                                err,
                                req.session.user.user +
                                  " " +
                                  req.session.user.school
                              );
                            }
                            logToFile(
                              "Debtor list was requested",
                              req?.session?.user?.user +
                                " " +
                                req.session.user.school
                            );
                            return res.json({
                              status: true,
                              message: data,
                              totalArr,
                            });
                          }
                        );
                      }
                    );
                  } else {
                    conn.query(
                      `SELECT name, class, discounts, phone_number FROM ${req?.session?.databaseName}_students WHERE class = ? AND status = ?  AND discounts <> 'scholarship' ORDER BY name`,
                      [filteredClass?.toLowerCase()?.trim(), "active"],
                      (err, restStud) => {
                        if (err) {
                          console.log(err);
                          logToFile(
                            err,
                            req.session.user.user +
                              " " +
                              req.session.user.school
                          );
                        }
                        data = [];
                        data?.push(...restStud);
                        logToFile(
                          "Debtor list was requested",
                          req?.session?.user?.user +
                            " " +
                            req.session.user.school
                        );
                        return res.json({
                          status: true,
                          message: data,
                          totalArr: [],
                        });
                      }
                    );
                  }
                })
                .catch((err) => {
                  logToFile(
                    err,
                    req?.session?.user?.user + " " + req.session.user.school
                  );
                  console.log(err);
                  res.json({
                    status: false,
                    message: "Something went wrong. Try refreshing",
                  });
                });
            }
          })
          .catch((error) => {
            logToFile(
              error,
              req?.session?.user?.user + " " + req.session.user.school
            );
            console.log(error);
            res.json({
              status: false,
              message: "Something went wrong. Try refreshing",
            });
          });
      }
    } else if (sort == "cleared") {
      if (filteredClass === "" || filteredTerm === "" || filteredSess === "") {
        return res.json({
          status: false,
          message: "Enter the necessaey fields",
        });
      } else {
        db.query(
          `SELECT * FROM ${
            req?.session?.databaseName
          }_payment_record WHERE (session = "${filteredSess?.trim()}" AND term = "${filteredTerm
            ?.toLowerCase()
            ?.trim()}"  AND class = "${filteredClass
            ?.toLowerCase()
            ?.trim()}" AND balance = 0 AND (payment_for LIKE '%fees%' OR payment_for = 'pta')) GROUP BY keyid ORDER BY created_at ASC`
        )
          .then((data) => {
            if (data.length !== 0) {
              let names = data.map((ind) => ind.keyid);
              conn.query(
                `SELECT COUNT(*) AS total FROM ${req?.session?.databaseName}_payment_record WHERE keyid IN (?) GROUP BY keyid ORDER BY created_at ASC`,
                [names],
                (err, totalArr) => {
                  if (err) {
                    console.log(err);
                    logToFile(
                      err,
                      req?.session?.user?.user + " " + req.session.user.school
                    );
                  }
                  logToFile(
                    "Cleared list was requested",
                    req?.session?.user?.user + " " + req.session.user.school
                  );
                  return res.json({
                    status: true,
                    message: data,
                    totalArr,
                  });
                }
              );
            } else {
              logToFile(
                "Cleared list was requested",
                req?.session?.user?.user + " " + req.session.user.school
              );
              return res.json({
                status: true,
                message: data,
                totalArr: [],
              });
            }
          })
          .catch((err) => {
            console.log(err);
            logToFile(
              err,
              req?.session?.user?.user + " " + req.session.user.school
            );
            res.json({
              status: false,
              message: "Something went wrong. Try refreshing",
            });
          });
      }
    } else if (sort == "all") {
      if (filteredClass === "" || filteredTerm === "" || filteredSess === "") {
        return res.json({
          status: false,
          message: "Enter the necessaey fields",
        });
      } else {
        db.query(
          `SELECT * FROM ${
            req?.session?.databaseName
          }_payment_record WHERE (session = "${filteredSess?.trim()}" AND term = "${filteredTerm
            ?.toLowerCase()
            ?.trim()}"  AND class = "${filteredClass
            ?.toLowerCase()
            ?.trim()}" AND (payment_for LIKE '%fees%' OR payment_for = 'pta')) GROUP BY keyid ORDER BY created_at ASC`
        )
          .then((data) => {
            if (data.length !== 0) {
              let names = data?.map((ind) => ind?.keyid);
              let names2 = data?.map((ind) => ind?.name);
              conn.query(
                `SELECT name, class, discounts, phone_number FROM ${req?.session?.databaseName}_students WHERE name NOT IN (?) AND class = ? AND status = ?`,
                [names2, filteredClass?.toLowerCase()?.trim(), "active"],
                (err, restStud) => {
                  if (err) {
                    console.log(err);
                    logToFile(
                      err,
                      req?.session?.user?.user + " " + req.session.user.school
                    );
                  }
                  data?.push(...restStud);
                }
              );
              conn.query(
                `SELECT COUNT(*) AS total FROM ${req?.session?.databaseName}_payment_record WHERE keyid IN (?) GROUP BY keyid ORDER BY created_at ASC`,
                [names],
                (err, totalArr) => {
                  if (err) {
                    console.log(err);
                    logToFile(
                      err,
                      req?.session?.user?.user + " " + req.session.user.school
                    );
                  }
                  logToFile(
                    "All list was requested",
                    req?.session?.user?.user + " " + req.session.user.school
                  );
                  return res.json({
                    status: true,
                    message: data,
                    totalArr,
                  });
                }
              );
            } else {
              conn.query(
                `SELECT name, class, discounts, phone_number FROM ${req?.session?.databaseName}_students WHERE class = ? AND status = ?`,
                [filteredClass?.toLowerCase()?.trim(), "active"],
                (err, restStud) => {
                  if (err) {
                    logToFile(
                      erro,
                      req?.session?.user?.user + " " + req.session.user.school
                    );
                    console.log(erro);
                  }
                  logToFile(
                    "All list was requested",
                    req?.session?.user?.user + " " + req.session.user.school
                  );

                  return res.json({
                    status: true,
                    message: restStud,
                    totalArr: [],
                  });
                }
              );
            }
          })
          .catch((err) => {
            console.log(err);
            logToFile(
              err,
              req?.session?.user?.user + " " + req.session.user.school
            );

            res.json({
              status: false,
              message: "Something went wrong. Try refreshing",
            });
          });
      }
    } else if (sort === "discounts") {
      if (filteredClass === "" || filteredClass === null) {
        sql = `SELECT name, class, phone_number, discounts FROM ${req?.session?.databaseName}_students WHERE (discounts != 'none' AND discounts IS NOT NULL AND TRIM(discounts) <> '') ORDER BY discounts`;
      } else {
        sql = `SELECT * FROM ${
          req?.session?.databaseName
        }_students WHERE (class = "${filteredClass
          ?.toLowerCase()
          ?.trim()}" AND discounts != 'none' AND discounts IS NOT NULL AND TRIM(discounts) <> '') ORDER BY discounts`;
      }
      db.query(sql)
        .then((data) => {
          return res.json({
            status: true,
            message: data,
          });
        })
        .catch((err) => {
          console.log(err);
          res.json({
            status: false,
            message: "Something went wrong. Try refreshing",
          });
        });
    } else {
      let sql;
      if (filteredClass === "" || filteredClass === null) {
        sql = `SELECT * FROM ${
          req?.session?.databaseName
        }_payment_record WHERE (session = "${filteredSess?.trim()}" AND term = "${filteredTerm
          ?.toLowerCase()
          ?.trim()}" AND payment_for = "${sort
          ?.toLowerCase()
          ?.trim()}") GROUP BY keyid ORDER BY created_at ASC`;
      } else {
        sql = `SELECT * FROM ${
          req?.session?.databaseName
        }_payment_record WHERE (session = "${filteredSess?.trim()}" AND term = "${filteredTerm
          ?.toLowerCase()
          ?.trim()}"  AND class = "${filteredClass
          ?.toLowerCase()
          ?.trim()}" AND payment_for = "${sort
          ?.toLowerCase()
          ?.trim()}") GROUP BY keyid ORDER BY created_at ASC`;
      }
      db.query(sql)
        .then((data) => {
          if (data.length !== 0) {
            let names = data.map((ind) => ind.keyid);
            conn.query(
              `SELECT COUNT(*) AS total, SUM(amount_paid) AS totalPaid FROM ${req?.session?.databaseName}_payment_record WHERE keyid IN (?) GROUP BY keyid`,
              [names],
              (err, totalArr) => {
                if (err) {
                  console.log(err);
                  logToFile(
                    err,
                    req?.session?.user?.user + " " + req.session.user.school
                  );
                }
                return res.json({
                  status: true,
                  message: data,
                  totalArr,
                });
              }
            );
          } else {
            return res.json({
              status: true,
              message: data,
            });
          }
        })
        .catch((err) => {
          console.log(err);
          res.json({
            status: false,
            message: "Something went wrong. Try refreshing",
          });
        });
    }
  }
};
const prepareWeeklyReport = (req, res) => {
  let { classes, date, sess, term, sort } = req.body;
  date = new Date(date).toJSON().slice(0, 10);
  let others = ["busfare"];
  if (classes.length === 0 || term === "" || date === "" || sess === "") {
    return res.json({
      status: false,
      message: "Enter all important fields",
    });
  } else {
    let conn = db.returnConnection();
    let sql;
    if (sort.toLowerCase() === "dop") {
      sql = `SELECT class, SUM(amount_paid) AS overTotal, SUM(pta) AS totalPTA, SUM(lesson) AS totalLesson, SUM(tuition) AS totalTuition, COUNT(*) AS totalPayment, SUM(balance) as balance FROM ${req?.session?.databaseName}_payment_record WHERE WEEK(DOP) = WEEK(?) AND term = ? AND session = ? AND payment_for NOT IN (?) AND class IN (?) GROUP BY class`;
    } else {
      sql = `SELECT class, SUM(amount_paid) AS overTotal, SUM(pta) AS totalPTA, SUM(lesson) AS totalLesson, SUM(tuition) AS totalTuition, COUNT(*) AS totalPayment, SUM(balance) as balance FROM ${req?.session?.databaseName}_payment_record WHERE WEEK(created_at) = WEEK(?) AND term = ? AND session = ? AND payment_for NOT IN (?) AND class IN (?) GROUP BY class`;
    }
    conn.query(sql, [date, term, sess, others, classes], (err, data) => {
      if (err) {
        console.log(err);
        logToFile(
          err,
          req?.session?.user?.user + " " + req.session.user.school
        );
      }
      conn.query(
        `SELECT class, SUM(amount_paid) AS overallBus, SUM(amount_paid) AS overTotal, SUM(pta) AS totalPTA, SUM(lesson) AS totalLesson, SUM(tuition) AS totalTuition, COUNT(*) AS totalPayment, SUM(balance) as balance FROM ${req?.session?.databaseName}_payment_record WHERE WEEK(created_at) = WEEK(?) AND term = ? AND session = ? AND payment_for IN (?) AND class IN (?) GROUP BY class`,
        [date, term, sess, others, classes],
        (err, data2) => {
          if (err) {
            console.log(err);
            logToFile(
              err,
              req?.session?.user?.user + " " + req.session.user.school
            );
          }
          logToFile(
            "Weekly report was requested",
            req?.session?.user?.user + " " + req.session.user.school
          );
          res.json({
            status: true,
            message: { weekly: data, others: data2 },
          });
        }
      );
    });
  }
};
const prepareStatement = (req, res) => {
  let { from, to, filteredClass } = req.body;

  let sql = "";
  if (from === "") {
    return res.json({
      status: false,
      message: "Enter start date",
    });
  } else {
    from = new Date(from);
    if (to === "" || to === null) to = "";
    else {
      to = new Date(to);
    }
    if (to === "" && filteredClass === "")
      sql = `SELECT *, SUM(amount_paid) AS TotalPaid FROM ${
        req?.session?.databaseName
      }_payment_record WHERE DATE(created_at) >= ${mysql.escape(
        from
      )} GROUP BY keyid ORDER BY created_at ASC`;
    if (to !== "" && filteredClass === "")
      sql = `SELECT *, SUM(amount_paid) AS TotalPaid FROM ${
        req?.session?.databaseName
      }_payment_record WHERE DATE(created_at) BETWEEN ${mysql.escape(
        from
      )} AND ${mysql.escape(to)} GROUP BY keyid ORDER BY created_at ASC`;
    if (to === "" && filteredClass !== "")
      sql = `SELECT *, SUM(amount_paid) AS TotalPaid FROM ${
        req?.session?.databaseName
      }_payment_record WHERE DATE(created_at) >= ${mysql.escape(
        from
      )} AND class = ${mysql.escape(
        filteredClass
      )} GROUP BY keyid ORDER BY created_at ASC`;
    if (to !== "" && filteredClass !== "")
      sql = `SELECT *, SUM(amount_paid) AS TotalPaid FROM ${
        req?.session?.databaseName
      }_payment_record WHERE class = ${mysql.escape(
        filteredClass
      )} AND DATE(created_at) BETWEEN ${mysql.escape(from)} AND ${mysql.escape(
        to
      )} GROUP BY keyid ORDER BY created_at ASC`;

    if (sql) {
      db.query(sql)
        .then((data) => {
          logToFile(
            "Statement was requested",
            req?.session?.user?.user + " " + req.session.user.school
          );
          res.json({
            status: true,
            message: data,
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
            message: "Somethng went wrong. Try again",
          });
        });
    }
  }
};
module.exports = {
  autoCompleteName,
  findSearchRecord,
  fetchAllRecords,
  printDisplay,
  deleteRecord,
  editRecord,
  findDebtors,
  prepareWeeklyReport,
  prepareStatement,
};
