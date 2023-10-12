const conn = require("../connections/conn"); // connection module made to apache server
const dbQueries = require("../connections/mysqlApi"); // mysql api module
const db = new dbQueries(conn);
require("../connections/prototypes");
const logErr = require("../connections/logErrors");
const logToFile = require("../connections/logToFile");
const mysql = require("mysql");

const uploadStudentsByXLsFile = (req, res) => {
  let { header, file } = req?.body;
  if (header?.length === 0 || file?.length === 0) {
    return res.json({
      status: false,
      message: "Try Again",
    });
  } else {
    let formattedHeader = header.join(", ");
    let formattedFile = [];
    file.forEach((element) => {
      let newObj = [];
      element.forEach((innerElement) => {
        for (let key in innerElement) {
          newObj.push(`"${innerElement[key]}"`);
        }
      });
      let joined = newObj.join(", ");
      let newFile = `(${joined})`;
      formattedFile.push(newFile);
    });
    db.query(
      `INSERT INTO ${req?.session?.databaseName}_students (${formattedHeader}) VALUES ${formattedFile}`
    )
      .then((data) => {
        logToFile(
          "Student list was uploaded",
          req.session.user.user + " " + req.session.user.school
        );

        return res.json({
          status: true,
          message: "Student added successfully!",
        });
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

const addStudent = (req, res) => {
  let {
    name,
    filteredClass,
    guardianName,
    tel,
    giveAdmNo,
    admNo,
    guardian_id,
  } = req?.body;
  if (filteredClass === "" || name === "" || guardianName === "") {
    return res.json({
      status: false,
      message: "Enter necessary fields",
    });
  } else {
    if (giveAdmNo === true || giveAdmNo === "true") {
      db.query(
        `SELECT * FROM ${
          req?.session?.databaseName
        }_students WHERE adm_no = ${mysql.escape(admNo)}`
      )
        .then((data) => {
          if (data.length > 0) {
            res.json({
              status: false,
              message: "Admission number " + admNo + " already exist.",
            });
          } else {
            db.insert(`${req?.session?.databaseName}_students`, {
              name: name?.toLowerCase(),
              class: filteredClass?.toLowerCase(),
              guardian_name: guardianName?.toLowerCase(),
              phone_number: tel,
              status: "active",
              adm_no: admNo?.toLowerCase()?.trim(),
              guardian_id: guardian_id,
            })
              .then((data) => {
                logToFile(
                  "A student was added",
                  req.session.user.user + " " + req.session.user.school
                );
                if (giveAdmNo === true || giveAdmNo === "true") {
                  db.updateByColumnName(
                    "last_adm_no",
                    admNo,
                    `${req?.session?.databaseName}_settings`
                  )
                    .then((data) => {})
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
                    });
                } else {
                  admNo = "";
                }
                return res.json({
                  status: true,
                  message: "Student added successfully!",
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
                  message: "something went wrong. Try refreshing or restarting",
                });
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
    } else {
      db.insert(`${req?.session?.databaseName}_students`, {
        name: name?.toLowerCase(),
        class: filteredClass?.toLowerCase(),
        guardian_name: guardianName?.toLowerCase(),
        phone_number: tel,
        status: "active",
        guardian_id,
      })
        .then((data) => {
          logToFile(
            "A student was added",
            req.session.user.user + " " + req.session.user.school
          );
          return res.json({
            status: true,
            message: "Student added successfully!",
          });
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
  }
};
const autocompleteFindStudent = (req, res) => {
  let { name, condition } = req.body;
  if (!condition) {
    if (req?.session?.user) {
      db.query(
        `SELECT name, class, id FROM ${
          req?.session?.databaseName
        }_students WHERE ( name LIKE ${mysql.escape(
          `%${name.toLowerCase()}%`
        )} OR adm_no = ${mysql.escape(name)} OR guardian_id = ${mysql.escape(
          name
        )}) ORDER BY class`
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
    // console.log(filterArray)
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
      }_students WHERE name LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )} AND ${sqlstring} ORDER BY name`;
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
const autocompleteFindGuardian = (req, res) => {
  let { name } = req.body;
  if (req?.session?.databaseName) {
    db.query(
      `SELECT guardian_name, guardian_id FROM ${
        req?.session?.databaseName
      }_students WHERE (guardian_name LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )} OR guardian_id = ${mysql.escape(
        `%${name.toLowerCase()}%`
      )}) GROUP BY guardian_name ORDER BY created_at`
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
};
const findStudent = (req, res) => {
  let { status, name, searchId, limit, page } = req.query;
  const offset = (page - 1) * limit;
  name = name.toLowerCase().trim();
  if (name !== "" && searchId !== 0) {
    if (status === "true") {
      let total = 0;
      db.query(
        `SELECT COUNT(*) as total FROM ${req?.session?.databaseName}_students WHERE id = "${searchId}"`
      )
        .then((data) => (total = data[0].total))
        .catch((err) => console.log(err));
      db.query(
        `SELECT * FROM ${req?.session?.databaseName}_students WHERE id = "${searchId}" ORDER BY created_at LIMIT ${limit} OFFSET ${offset}`
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
    } else if (status === "false") {
      let total = 0;
      db.query(
        `SELECT COUNT(*) as total FROM ${
          req?.session?.databaseName
        }_students WHERE name LIKE ${mysql.escape(`%${name.toLowerCase()}%`)}`
      )
        .then((data) => (total = data[0].total))
        .catch((err) => console.log(err));
      db.query(
        `SELECT * FROM ${
          req?.session?.databaseName
        }_students WHERE name LIKE ${mysql.escape(
          `%${name.toLowerCase()}%`
        )} ORDER BY name LIMIT ${limit} OFFSET ${offset}`
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
  } else {
    return res.json({
      status: false,
      message: "Empty search",
    });
  }
};
const findGuardian = (req, res) => {
  let { searchId } = req.body;
  db.query(
    `SELECT * FROM ${
      req?.session?.databaseName
    }_students WHERE guardian_id = ${mysql.escape(
      searchId
    )} OR guardian_name = ${
      typeof searchId === "string"
        ? mysql.escape(searchId.toLowerCase())
        : mysql.escape(searchId)
    } ORDER BY created_at`
  )
    .then((data) => {
      if (data) {
        res.json({
          status: true,
          message: data,
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
};

const filterByClass = (req, res) => {
  let { limit, page, filteredClass } = req.query;
  const offset = (page - 1) * limit;
  let total = 0;
  db.query(
    `SELECT COUNT(*) as total FROM ${
      req?.session?.databaseName
    }_students WHERE class = ${mysql.escape(
      filteredClass?.trim().toLowerCase()
    )}`
  )
    .then((data) => (total = data[0].total))
    .catch((err) => console.log(err));
  db.query(
    `SELECT * FROM ${
      req?.session?.databaseName
    }_students WHERE class = ${mysql.escape(
      filteredClass?.trim().toLowerCase()
    )} ORDER BY name LIMIT ${limit} OFFSET ${offset}`
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
const fetchStudents = (req, res) => {
  let { limit, page } = req.query;
  const offset = (page - 1) * limit;
  let total = 0;
  db.query(
    `SELECT COUNT(*) as total FROM ${req?.session?.databaseName}_students`
  )
    .then((data) => (total = data[0].total))
    .catch((err) => console.log(err));
  db.query(
    `SELECT * FROM ${req?.session?.databaseName}_students ORDER BY id LIMIT ${limit} OFFSET ${offset}`
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
const printPreview = (req, res) => {
  let { key } = req.query;
  if (key) {
    db.getByColumnName(`id`, key, `${req?.session?.databaseName}_students`)
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
};
const deleteStudent = (req, res) => {
  let { key } = req.query;
  if (key) {
    db.query(
      `DELETE FROM ${
        req?.session?.databaseName
      }_students WHERE id = ${mysql.escape(key)}`
    )
      .then((data) => {
        logToFile(
          "A student was deleted",
          req.session.user.user + " " + req.session.user.school
        );
        return res.json({
          status: true,
          message: "Student deleted succesfully",
        });
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
const updateStudentInfo = (req, res) => {
  let {
    name,
    newClass,
    address,
    guardianName,
    tel,
    guardianID,
    studentAdm,
    status,
    id,
    discounts,
  } = req.body;
  if (name === "" || newClass === "" || guardianName === "") {
    res?.json({
      status: false,
      message: "Enter all necessary fields",
    });
  } else {
    let staVal = "";
    status === true ? (staVal = "active") : (staVal = "left");
    db.query(
      `UPDATE ${req?.session?.databaseName}_students SET name = ${mysql.escape(
        name?.toLowerCase()?.trim()
      )}, class = ${mysql.escape(
        newClass?.toLowerCase()?.trim()
      )}, guardian_name = ${mysql.escape(
        guardianName?.toLowerCase()?.trim()
      )}, address = ${mysql.escape(
        address?.toLowerCase()?.trim()
      )}, discounts = ${mysql.escape(
        discounts?.toLowerCase()?.trim()
      )}, phone_number = ${mysql.escape(tel)}, guardian_id = ${mysql.escape(
        guardianID?.trim()
      )}, adm_no = ${mysql.escape(studentAdm?.trim())}, status = ${mysql.escape(
        staVal?.toLowerCase()?.trim()
      )} WHERE id = ${id}`
    )
      .then((data) => {
        logToFile(
          "A Student information was updated",
          req.session.user.user + " " + req.session.user.school
        );

        return res.json({
          status: true,
          message: "Student updated Succesfully",
        });
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
const promoteStudents = (req, res) => {
  let { ids, promoteClass, receipt, term, session } = req.body;
  if (
    ids.length === 0 ||
    promoteClass === "" ||
    ids.length === null ||
    promoteClass === null
  ) {
    return res?.json({
      status: false,
      message: "Nothing to Promote",
    });
  } else {
    let conn = db.returnConnection();
    if (!receipt) {
      conn.query(
        `UPDATE ${
          req?.session?.databaseName
        }_students SET class = ${mysql.escape(promoteClass)} WHERE id IN (?) `,
        [ids],
        (err, data) => {
          if (err) {
            console.log(err);
            logToFile(
              err,
              req.session.user.user + " " + req.session.user.school
            );
            res.json({
              status: false,
              message: "Something went wrong. Try refreshing",
            });
          }
          logToFile(
            "some students were promoted succesfully",
            req.session.user.user + " " + req.session.user.school
          );

          res?.json({
            status: true,
            message: "Students Promoted Succesfully",
          });
        }
      );
    } else {
      conn.query(
        `UPDATE ${
          req?.session?.databaseName
        }_students SET class = ${mysql.escape(promoteClass)} WHERE id IN (?) `,
        [ids],
        (err, data) => {
          if (err) {
            console.log(err);
            logToFile(
              err,
              req.session.user.user + " " + req.session.user.school
            );
            res.json({
              status: false,
              message: "Something went wrong. Try refreshing",
            });
          }
          conn.query(
            `SELECT name FROM ${
              req?.session?.databaseName
            }_students WHERE class = ${mysql.escape(
              promoteClass
            )} AND id IN (?) `,
            [ids],
            (err2, data2) => {
              if (err2) {
                console.log(err2);
                logToFile(
                  err2,
                  req.session.user.user + " " + req.session.user.school
                );
                res.json({
                  status: false,
                  message: "Something went wrong. Try refreshing",
                });
              }
              let names = data2?.map((name) => name?.name);
              conn.query(
                `UPDATE ${
                  req?.session?.databaseName
                }_payment_record SET class = ${mysql.escape(
                  promoteClass
                )} WHERE term = ? AND session = ? AND name IN (?)`,
                [term, session, names],
                (error, data) => {
                  if (error) {
                    console.log(error);
                    logToFile(
                      error,
                      req.session.user.user + " " + req.session.user.school
                    );
                    res.json({
                      status: false,
                      message: "Something went wrong. Try refreshing",
                    });
                  }
                  logToFile(
                    "some students were promoted succesfully and receipt class changed",
                    req.session.user.user + " " + req.session.user.school
                  );

                  res?.json({
                    status: true,
                    message: "Students Promoted Succesfully",
                  });
                }
              );
            }
          );
        }
      );
    }
  }
};
const deleteMultipleStudents = (req, res) => {
  let { ids } = req.body;
  console.log(ids);
  if (ids.length > 0) {
    let conn = db.returnConnection();
    conn.query(
      `DELETE FROM ${req?.session?.databaseName}_students WHERE id IN (?)`,
      [ids],
      (err, data) => {
        if (err) {
          console.log(err);
          logToFile(err, req.session.user.user + " " + req.session.user.school);
          return res.json({
            status: false,
            message: "Something went wrong. Try refreshing.",
          });
        }
        logToFile(
          "some students were deleted",
          req.session.user.user + " " + req.session.user.school
        );

        res.json({
          status: true,
          message: "Deleted Succesfully",
        });
      }
    );
  } else {
    return res.json({
      status: false,
      message: "Make a selection.",
    });
  }
};
const updateMultipleStudents = (req, res) => {
  let { ids, others } = req.body;
  let sql = "";
  let sqlPart = "";

  for (other in others) {
    if (other === "updateGuardianName" && others[other] !== "") {
      sqlPart += `guardian_name = ${mysql.escape(
        others[other].trim().toLowerCase()
      )}, `;
    }
    if (other === "updateClass" && others[other] !== "") {
      sqlPart += `class = ${mysql.escape(
        others[other].trim().toLowerCase()
      )}, `;
    }
    if (other === "updateAddress" && others[other] !== "") {
      sqlPart += `address = ${mysql.escape(
        others[other].trim().toLowerCase()
      )}, `;
    }
    if (other === "updateTel" && others[other] !== "") {
      sqlPart += `phone_number = ${mysql.escape(
        others[other].trim().toLowerCase()
      )}, `;
    }
    if (other === "UpdateGuardianId" && others[other] !== "") {
      sqlPart += `guardian_id = ${mysql.escape(
        others[other].trim().toLowerCase()
      )}, `;
    }
    if (other === "updateDiscount" && others[other] !== "") {
      sqlPart += `discounts = ${mysql.escape(
        others[other].trim().toLowerCase()
      )}, `;
    }
    if (other === "updatestatus" && others[other] !== "") {
      if (others[other] === "true" || others[other] === true) {
        sqlPart += `status = "active"`;
      }
      if (others[other] === "false" || others[other] === false) {
        sqlPart += `status = "left"`;
      }
    }
  }
  sql = `UPDATE ${req?.session?.databaseName}_students SET ${sqlPart} WHERE id IN (?)`;

  conn.query(sql, [ids], (err, data) => {
    if (err) {
      console.log(err);
      logToFile(err, req.session.user.user + " " + req.session.user.school);
      return res.json({
        status: false,
        message: "Something went wrong. Try refreshing.",
      });
    }
    logToFile(
      "some students information were updated",
      req.session.user.user + " " + req.session.user.school
    );

    res.json({
      status: true,
      message: "Updated Succesfully",
    });
  });
};
module.exports = {
  uploadStudentsByXLsFile,
  addStudent,
  autocompleteFindStudent,
  autocompleteFindGuardian,
  findStudent,
  findGuardian,
  filterByClass,
  fetchStudents,
  printPreview,
  deleteStudent,
  updateStudentInfo,
  promoteStudents,
  deleteMultipleStudents,
  updateMultipleStudents,
};
