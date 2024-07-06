const conn = require("../connections/conn");

const mysql = require("mysql");

// importing custom mysql modules.
const dbQueries = require("../connections/mysqlApi");

// initialization with the connection as a parameter
const db = new dbQueries(conn);

// custom modules to log out where an error has occur and the line.
const logErr = require("../connections/logErrors");
const logToFile = require("../connections/logToFile");
let format = false;
let autoTotal = (student) => {
  try {
    let splitName = student?.split(" ");
    if (format) {
      if (
        splitName[splitName.length - 1]?.toLowerCase().includes("mercury") ||
        splitName[splitName.length - 1]?.toLowerCase().includes("venus") ||
        splitName[splitName.length - 1]?.toLowerCase().includes("mars") ||
        splitName[splitName.length - 1]?.toLowerCase().includes("jupiter") ||
        splitName[splitName.length - 1]?.toLowerCase().includes("earth")
      ) {
        splitName = splitName?.splice(0, 3);
        if (
          splitName?.length > 1 &&
          splitName[0]?.toLowerCase() === "kindergarten"
        ) {
          splitName = splitName?.splice(0, 1);
        }
      }
      if (splitName[0].toLowerCase() === "nursery" && splitName.length > 2) {
        console.log();
        if (splitName.join(" ").toLowerCase().includes("admission"));
        else splitName.pop();
      }
      if (
        splitName[0].toLowerCase().startsWith("ss") &&
        splitName[0].length >= 2
      ) {
        let newSplitName = [splitName[0], splitName[1]];
        splitName = newSplitName;
      }
      if (splitName[0].toLowerCase() === "pre" && splitName.length > 2) {
        splitName.pop();
      }
    }

    return splitName?.join(" ")?.toLowerCase();
  } catch (error) {
    console.log(error);
  }
};
let handleDebt = (array1, array2) => {
  let totalDebt = [];
  array1.map((arr1, i) => {
    array2.map((arr2) => {
      if (arr1.class == arr2.class) {
        let total = 0;
        let d = totalDebt.find((e) => e.class == arr2.class);
        if (d != undefined) {
          let newTotal = totalDebt.filter((h) => h.class !== arr2.class);
          if (d.total > arr2.total) {
            total = d.total - arr2.total;
          }
          if (arr2.total > d.total) {
            total = arr2.total - d.total;
          }
          newTotal.push({ class: d.class, total });
          totalDebt = newTotal;
        } else {
          if (arr1.total > arr2.total) {
            total = arr1.total - arr2.total;
          }
          if (arr2.total > arr1.total) {
            total = arr2.total - arr1.total;
          }
          totalDebt.push({
            class: arr1.class,
            total,
          });
        }
      } else {
        let d = totalDebt.find((e) => e.class == arr1.class);
        if (d != undefined) {
          return;
        } else {
          totalDebt.push({
            class: arr1.class,
            total: arr1.total,
          });
        }
      }
    });
  });
  // console.log(totalDebt);
  return totalDebt;
};
let filterWithClass = (arr) => {
  let newFiltered = [];
  if (arr.length > 0) {
    arr.map((one) => {
      let d = arr.find((h) => h.class === one.class);
      let n = arr.filter((h) => h.class === one.class);
      if (d === undefined) {
      } else {
        let length = n.length;
        let d2 = newFiltered.find((h) => h.class === one.class);
        if (d2 === undefined) {
          newFiltered.push({ class: one.class, total: length, name: one.name });
        }
      }
    });
  } else {
    return [];
  }
  // console.log(newFiltered);
  return newFiltered;
};

const dashboardDetails = (req, res) => {
  if (req.session.user) {
    // fetch the total number of student in the database using async method that returns a promise, ...custom mysql module
    db.query(
      `SELECT COUNT(*) AS count FROM ${req?.session?.databaseName}_students WHERE status = "active"`
    )
      .then((student) => {
        // fetch the total of money paid monthly.
        db.query(
          `SELECT SUM(amount_paid) AS total, MONTH(created_at) AS month_payment FROM ${req?.session?.databaseName}_payment_record WHERE MONTH(created_at) = MONTH(CURRENT_DATE()) GROUP BY month_payment`
        )
          .then((month) => {
            // fetch the total of money paid monthly.
            db.query(
              `SELECT SUM(amount_paid) AS total, YEAR(created_at) AS year_payment FROM ${req?.session?.databaseName}_payment_record WHERE YEAR(created_at) = YEAR(CURRENT_DATE()) GROUP BY year_payment`
            )
              .then((year) => {
                db.getAll(`${req?.session?.databaseName}_settings`)
                  .then((data) => {
                    let fees = JSON.parse(data[0].fees);
                    let classes = JSON.parse(data[0].classes);
                    let current_session = data[0].current_session;
                    let current_term = data[0].current_term;
                    // console.log(current_session);
                    let feeObj = {};
                    let allClass = [];
                    let feeClass = {};
                    [...classes].map((clas) => {
                      allClass.push(clas);
                    });
                    [...fees].map((fee) => {
                      feeObj[fee[0]] = Number(fee[1]) || 0;
                    });
                    // console.log(feeObj);

                    allClass.forEach((indClass) => {
                      feeClass[autoTotal(indClass)] =
                        feeObj[autoTotal(indClass)] || 0;
                    });
                    let initCon = db.returnConnection();
                    initCon.query(
                      `SELECT name, class, keyid, amount_paid FROM ${
                        req?.session?.databaseName
                      }_payment_record WHERE term = ${mysql.escape(
                        current_term
                      )} AND session = ${mysql.escape(
                        current_session
                      )} AND payment_for LIKE "%fee%" GROUP BY keyid`,
                      (err, data2) => {
                        if (err) {
                          console.log(err);
                          logToFile(
                            err,
                            req.session.user.user +
                              " " +
                              req.session.user.school
                          );
                        }
                        // console.log(data2);
                        let nameThatPaid = [];
                        let newdata = filterWithClass(data2);
                        // console.log(newdata);
                        if (newdata.length > 0) {
                          newdata.map((elem) => {
                            nameThatPaid.push(elem.name);
                          });
                          // console.log(nameThatPaid);
                          initCon.query(
                            `SELECT name, class, COUNT(*) as total FROM ${req?.session?.databaseName}_students WHERE discounts != "scholarship" AND status = "active" GROUP BY class`,
                            (err2, data3) => {
                              if (err2) {
                                logToFile(
                                  err2,
                                  req.session.user.user +
                                    " " +
                                    req.session.user.school
                                );
                              }
                              // console.log(data3);
                              let returnedDebt = [];
                              if (data3.length > newdata.length) {
                                returnedDebt = handleDebt(data3, newdata);
                              } else {
                                returnedDebt = handleDebt(newdata, data3);
                              }
                              let finalDebt = [];
                              // console.log(returnedDebt);
                              returnedDebt.map((item) => {
                                if (
                                  feeClass.hasOwnProperty(autoTotal(item.class))
                                ) {
                                  let d = finalDebt.find(
                                    (r) => r.class === item.class
                                  );
                                  // console.log(d, item.class, finalDebt);
                                  // console.log(d === undefined);
                                  if (d === undefined) {
                                    finalDebt.push({
                                      class: item.class,
                                      debt:
                                        item.total *
                                        feeClass[autoTotal(item.class)],
                                      total: item.total,
                                    });
                                  }
                                }
                              });
                              // console.log(finalDebt);
                              // return the total output in a json format
                              initCon.query(
                                `SELECT class, COUNT(*) AS total FROM ${req?.session?.databaseName}_students WHERE discounts != "scholarship" AND status = "active" GROUP BY class`,
                                (err2, data4) => {
                                  let totalTerm = 0;
                                  let totalArr = [];
                                  // console.log(returnedDebt);
                                  data4.map((item) => {
                                    if (
                                      feeClass.hasOwnProperty(
                                        autoTotal(item.class)
                                      )
                                    ) {
                                      totalArr.push({
                                        class: item.class,
                                        debt:
                                          item.total *
                                          feeClass[autoTotal(item.class)],
                                      });
                                      totalTerm +=
                                        item.total *
                                        feeClass[autoTotal(item.class)];
                                    }
                                  });

                                  initCon.query(
                                    `SELECT SUM(amount_paid) AS amountPaid FROM ${
                                      req?.session?.databaseName
                                    }_payment_record WHERE DATE(created_at) = ${mysql.escape(
                                      new Date(Date.now()).toJSON().slice(0, 10)
                                    )}`,
                                    (err2, data5) => {
                                      if (err2) {
                                        console.log(err2);
                                        logToFile(
                                          err2,
                                          req.session.user.user +
                                            " " +
                                            req.session.user.school
                                        );
                                      }
                                      db.query(
                                        `SELECT class, balance FROM ${
                                          req?.session?.databaseName
                                        }_payment_record WHERE balance > 0 AND term = ${mysql.escape(
                                          current_term
                                        )} AND session = ${mysql.escape(
                                          current_session
                                        )} GROUP BY keyid`
                                      ).then((data6) => {
                                        // console.log(data6);
                                        // console.log(finalDebt);

                                        data6.map((bal) => {
                                          finalDebt.map((fin) => {
                                            if (bal.class === fin.class) {
                                              fin.debt += Number(bal.balance);
                                              // console.log(finalDebt);
                                            }
                                          });
                                        });
                                        return res.json({
                                          status: true,
                                          message: student[0].count,
                                          year: year,
                                          month: month,
                                          debts: finalDebt,
                                          classes: allClass.length,
                                          totalTerm,
                                          totalEachClass: totalArr,
                                          totalCollection: data5[0].amountPaid,
                                        });
                                      });
                                      // console.log(finalDebt);
                                    }
                                  );
                                }
                              );
                            }
                          );
                        } else {
                          initCon.query(
                            `SELECT name, class, COUNT(*) as total FROM ${req?.session?.databaseName}_students WHERE discounts != ? AND status = ? GROUP BY class`,
                            ["scholarship", "active"],
                            (err2, data3) => {
                              if (err2) {
                                console.log(err2);
                                logToFile(
                                  err2,
                                  req.session.user.user +
                                    " " +
                                    req.session.user.school
                                );
                              }
                              // console.log(data3);
                              let returnedDebt = [];
                              returnedDebt = [...data3];
                              let finalDebt = [];
                              // console.log(returnedDebt);
                              returnedDebt.map((item) => {
                                if (
                                  feeClass.hasOwnProperty(autoTotal(item.class))
                                ) {
                                  finalDebt.push({
                                    class: item.class,
                                    debt:
                                      item.total *
                                      feeClass[autoTotal(item.class)],
                                    total: item.total,
                                    amount: feeClass[autoTotal(item.class)],
                                  });
                                }
                              });
                              // console.log(finalDebt);
                              // return the total output in a json format
                              initCon.query(
                                `SELECT class, COUNT(*) AS total FROM ${req?.session?.databaseName}_students WHERE discounts != 'scholarship' AND status = 'active' GROUP BY class`,
                                (err2, data4) => {
                                  let totalTerm = 0;
                                  let totalArr = [];
                                  data4.map((item) => {
                                    if (
                                      feeClass.hasOwnProperty(
                                        autoTotal(item.class)
                                      )
                                    ) {
                                      totalArr.push({
                                        class: item.class,
                                        debt:
                                          item.total *
                                          feeClass[autoTotal(item.class)],
                                        total: item.total,
                                        amount: feeClass[autoTotal(item.class)],
                                      });
                                      totalTerm +=
                                        item.total *
                                        feeClass[autoTotal(item.class)];
                                    }
                                  });

                                  initCon.query(
                                    `SELECT SUM(amount_paid) AS amountPaid FROM ${
                                      req?.session?.databaseName
                                    }_payment_record WHERE DATE(created_at) = ${mysql.escape(
                                      new Date(Date.now()).toJSON().slice(0, 10)
                                    )}`,
                                    (err2, data5) => {
                                      db.query(
                                        `SELECT class, balance FROM ${
                                          req?.session?.databaseName
                                        }_payment_record WHERE balance > 0 AND session = ${mysql.escape(
                                          current_session
                                        )} AND term = ${mysql.escape(
                                          current_term
                                        )} GROUP BY keyid`
                                      ).then((data6) => {
                                        // console.log(data6);
                                        // console.log(finalDebt);

                                        data6.map((bal) => {
                                          finalDebt.map((fin) => {
                                            if (bal.class === fin.class) {
                                              fin.debt += Number(bal.balance);
                                              // console.log(finalDebt);
                                            }
                                          });
                                        });
                                        return res.json({
                                          status: true,
                                          message: student[0].count,
                                          year: year,
                                          month: month,
                                          debts: finalDebt,
                                          classes: allClass.length,
                                          totalTerm,
                                          totalEachClass: totalArr,
                                          totalCollection: data5[0].amountPaid,
                                        });
                                      });
                                      // console.log(finalDebt);
                                    }
                                  );
                                }
                              );
                            }
                          );
                        }
                      }
                    );
                  })
                  .catch((error) => {
                    console.log(error);
                  });
              })
              .catch((err) => {
                // if an error occur, log error using the custom error module
                logErr(
                  err,
                  __filename,
                  new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
                );
              });
          })
          .catch((err) => {
            logErr(
              err,
              __filename,
              new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
            );
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
};
const changePassword = async (req, res) => {
  let { user, school, oldPassword, newPassword } = req.body;

  if (
    user === "" ||
    oldPassword === "" ||
    newPassword === "" ||
    school === ""
  ) {
    return res.json({
      status: false,
      message: "Fill in necessary fields",
    });
  }
  if (oldPassword === newPassword) {
    return res.json({
      status: false,
      message: "Nothing to update",
    });
  } else {
    try {
      let data = await db.query(
        `SELECT id FROM ${
          req?.session?.databaseName
        }_users WHERE user = ${mysql.escape(user)} AND school = ${mysql.escape(
          school
        )} AND password = ${mysql.escape(oldPassword)}`
      );
      if (data.length > 0) {
        let { id } = data[0];
        if (id) {
          db.query(
            `UPDATE ${
              req?.session?.databaseName
            }_users SET password = ${mysql.escape(
              newPassword
            )} WHERE id = ${id}`
          )
            .then(async (data) => {
              try {
                let data2 = await db.query(
                  `SELECT id FROM school_cred WHERE admin = ${mysql.escape(
                    user
                  )} AND school = ${mysql.escape(
                    school
                  )} AND password = ${mysql.escape(oldPassword)}`
                );
                if (data2.length > 0) {
                  let id2 = data2[0].id;
                  if (id2) {
                    db.query(
                      `UPDATE school_cred SET password = ${mysql.escape(
                        newPassword
                      )} WHERE id = ${id2}`
                    )
                      .then((data2) => {
                        logToFile(
                          "A users password was changed.",
                          req.session.user.user + " " + req.session.user.school
                        );

                        return res.json({
                          status: true,
                          message: "Password changed succesfully",
                        });
                      })
                      .catch((erro) => {
                        console.log(erro);
                        logToFile(
                          erro,
                          req?.session?.user?.user +
                            " " +
                            req.session.user.school
                        );
                        return res.json({
                          status: false,
                          message: "Failed: something went wrong",
                        });
                      });
                  }
                } else {
                  return res.json({
                    status: true,
                    message: "Password changed succesfully",
                  });
                }
              } catch (error2) {
                console.log(error2);
                logToFile(
                  error2,
                  req?.session?.user?.user + " " + req.session.user.school
                );
                return res.json({
                  status: false,
                  message: "Failed: something went wrong",
                });
              }
            })
            .catch((err) => {
              console.log(err);
              logToFile(
                err,
                req?.session?.user?.user + " " + req.session.user.school
              );
              return res.json({
                status: false,
                message: "Failed: something went wrong",
              });
            });
        }
      } else {
        return res.json({
          status: false,
          message: "Wrong old password",
        });
      }
    } catch (error) {
      console.log(error);
      logToFile(
        error,
        req?.session?.user?.user + " " + req.session.user.school
      );
      return res.json({
        status: false,
        message: "Failed to change password",
        error,
      });
    }
  }
};
const expandDebt = (req, res) => {
  let { sess, term } = req.body;
  if (sess) {
    db.query(
      `SELECT fee_history FROM ${
        req?.session?.databaseName
      }_settings WHERE session_history = ${mysql.escape(
        sess
      )} AND term_history = ${mysql.escape(term.trim().toLowerCase())}`
    )
      .then((feeData) => {
        db.getAll(`${req?.session?.databaseName}_settings`)
          .then((data) => {
            if (feeData.length > 0) {
              let fees = JSON.parse(feeData[0].fee_history);
              let classes = JSON.parse(data[0].classes);
              let current_session = sess;
              let current_term = term;
              // console.log(current_session);
              let feeObj = {};
              let allClass = [];
              let feeClass = {};
              [...classes].map((clas) => {
                allClass.push(clas);
              });
              [...fees].map((fee) => {
                feeObj[fee[0]] = Number(fee[1]) || 0;
              });
              // console.log(feeObj);

              allClass.forEach((indClass) => {
                feeClass[autoTotal(indClass)] =
                  feeObj[autoTotal(indClass)] || 0;
              });
              let initCon = db.returnConnection();
              initCon.query(
                `SELECT name, class, keyid, amount_paid FROM ${
                  req?.session?.databaseName
                }_payment_record WHERE term = ${mysql.escape(
                  current_term
                )} AND session = ${mysql.escape(
                  current_session
                )} AND payment_for LIKE "%fee%" GROUP BY keyid`,
                (err, data2) => {
                  if (err) {
                    console.log(err);
                    logToFile(
                      err,
                      req.session.user.user + " " + req.session.user.school
                    );
                  }
                  // console.log(data2);
                  let nameThatPaid = [];
                  let newdata = filterWithClass(data2);
                  // console.log(newdata);
                  if (newdata.length > 0) {
                    newdata.map((elem) => {
                      nameThatPaid.push(elem.name);
                    });
                    // console.log(nameThatPaid);
                    initCon.query(
                      `SELECT name, class, COUNT(*) as total FROM ${req?.session?.databaseName}_students WHERE discounts != 'scholarship' AND status = 'active' GROUP BY class`,
                      (err2, data3) => {
                        if (err2) {
                          console.log(err2);
                          logToFile(
                            err2,
                            req.session.user.user +
                              " " +
                              req.session.user.school
                          );
                        }
                        // console.log(data3);
                        let returnedDebt = [];
                        if (data3.length > newdata.length) {
                          returnedDebt = handleDebt(data3, newdata);
                        } else {
                          returnedDebt = handleDebt(newdata, data3);
                        }
                        let finalDebt = [];
                        // console.log(returnedDebt);
                        returnedDebt.map((item) => {
                          if (feeClass.hasOwnProperty(autoTotal(item.class))) {
                            let d = finalDebt.find(
                              (r) => r.class === item.class
                            );
                            // console.log(d, item.class, finalDebt);
                            // console.log(d === undefined);
                            if (d === undefined) {
                              finalDebt.push({
                                class: item.class,
                                debt:
                                  item.total * feeClass[autoTotal(item.class)],
                                total: item.total,
                              });
                            }
                          }
                        });
                        db.query(
                          `SELECT class, balance FROM ${
                            req?.session?.databaseName
                          }_payment_record WHERE balance > 0 AND term = ${mysql.escape(
                            term?.trim()?.toLowerCase()
                          )} AND session = ${mysql.escape(
                            sess?.toLowerCase().trim()
                          )} GROUP BY keyid`
                        ).then((data6) => {
                          data6.map((bal) => {
                            finalDebt.map((fin) => {
                              if (bal.class === fin.class) {
                                fin.debt += Number(bal.balance);
                                // console.log(finalDebt);
                              }
                            });
                          });
                          return res.json({
                            status: true,
                            debts: finalDebt,
                            fees,
                          });
                        });
                      }
                    );
                  } else {
                    initCon.query(
                      `SELECT name, class, COUNT(*) as total FROM ${req?.session?.databaseName}_students WHERE discounts != ? AND status = ? GROUP BY class`,
                      ["scholarship", "active"],
                      (err2, data3) => {
                        if (err2) {
                          console.log(err2);
                          logToFile(
                            err2,
                            req.session.user.user +
                              " " +
                              req.session.user.school
                          );
                        }
                        // console.log(data3);
                        let returnedDebt = [];
                        returnedDebt = [...data3];
                        let finalDebt = [];
                        // console.log(returnedDebt);
                        returnedDebt.map((item) => {
                          if (feeClass.hasOwnProperty(autoTotal(item.class))) {
                            finalDebt.push({
                              class: item.class,
                              debt:
                                item.total * feeClass[autoTotal(item.class)],
                              total: item.total,
                            });
                          }
                        });
                        // console.log(finalDebt);
                        // return the total output in a json format
                        initCon.query(
                          `SELECT class, COUNT(*) AS total FROM ${req?.session?.databaseName}_students WHERE discounts != 'scholarship' AND status = 'active' GROUP BY class`,
                          (err2, data4) => {
                            let totalTerm = 0;
                            // console.log(returnedDebt);
                            data4.map((item) => {
                              if (
                                feeClass.hasOwnProperty(autoTotal(item.class))
                              ) {
                                totalTerm +=
                                  item.total * feeClass[autoTotal(item.class)];
                              }
                            });

                            initCon.query(
                              `SELECT SUM(amount_paid) AS amountPaid FROM ${
                                req?.session?.databaseName
                              }_payment_record WHERE DATE(created_at) = ${mysql.escape(
                                new Date(Date.now()).toJSON().slice(0, 10)
                              )}`,
                              (err2, data5) => {
                                db.query(
                                  `SELECT class, balance FROM ${req?.session?.databaseName}_payment_record WHERE balance > 0 GROUP BY keyid`
                                ).then((data6) => {
                                  // console.log(data6);
                                  // console.log(finalDebt);

                                  data6.map((bal) => {
                                    finalDebt.map((fin) => {
                                      if (bal.class === fin.class) {
                                        fin.debt += Number(bal.balance);
                                        // console.log(finalDebt);
                                      }
                                    });
                                  });
                                  return res.json({
                                    status: true,
                                    message: student[0].count,
                                    year: year,
                                    month: month,
                                    debts: finalDebt,
                                    classes: allClass.length,
                                    totalTerm,
                                    totalCollection: data5[0].amountPaid,
                                  });
                                });
                                // console.log(finalDebt);
                              }
                            );
                          }
                        );
                      }
                    );
                  }
                }
              );
            } else {
              res.json({
                status: false,
                message: "No record",
              });
            }
          })
          .catch((error) => {
            console.log(error);
          });
      })
      .catch((err) => {
        console.log(err);
        logToFile(err, req.session.user.user + " " + req.session.user.school);
      });
  }
};
module.exports = {
  dashboardDetails,
  changePassword,
  expandDebt,
};
