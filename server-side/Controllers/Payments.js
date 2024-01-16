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

// require prototype
require("../connections/prototypes");

const fetchClasses = (req, res) => {
  if (req?.session?.user) {
    db.query(`SELECT * FROM ${req?.session?.databaseName}_settings`)
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

const autoCompleteFindName = (req, res) => {
  // destructure "name" from req.body object
  let { name } = req.body;

  if (req?.session?.user) {
    // fetch name from table "students"
    db.query(
      `SELECT * FROM ${
        req?.session?.databaseName
      }_students WHERE (name LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )} OR guardian_id LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )} OR guardian_name LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )} OR adm_no LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )} OR phone_number LIKE ${mysql.escape(
        `%${name.toLowerCase()}%`
      )}) ORDER BY class`
    )
      .then((data) =>
        res.json({
          status: true,
          message: data,
        })
      )
      .catch((err) => {
        logToFile(
          "Error:" + err,
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
  } else {
    res.json({
      status: false,
      message: "Not logged in",
    });
  }
};

const savePayment = async (req, res) => {
  // create a random key using randomKey function from prototype modules
  let key = randomKey() + randomKey();

  // chech if user is logged in and destructure variable from req.body object
  if (req?.session?.user) {
    let { datas } = req.body;
    let {
      name,
      paymentId,
      studentClass,
      DOP,
      DOB,
      DOG,
      PTA,
      lesson,
      paymentFor,
      paymentMethod,
      term,
      totalFee,
      feePaid,
      balance,
      remark,
      session,
      loggedUser,
      defaultWallet,
      studentId,
    } = datas;

    // check if variables are empty
    if (
      name === "" ||
      paymentId === "" ||
      studentClass === "" ||
      DOP === "" ||
      paymentFor === "" ||
      paymentMethod === "" ||
      term === "" ||
      totalFee === "" ||
      feePaid === "" ||
      balance === "" ||
      PTA === "" ||
      lesson === "" ||
      PTA === null ||
      lesson === null ||
      session === ""
    ) {
      // return error to frontend if any variable is empty
      return res.json({
        status: false,
        message: "Please fill in all the textbox",
      });
    } else {
      let checkIfTuition = (feePaid, les, pta) => {
        // console.log(feePaid, lesson, pta);
        if (parseInt(feePaid) > parseInt(pta)) {
          // console.log("less than pta");
          feePaid -= pta;
        } else {
          PTA = 0;
          lesson = 0;
        }
        // console.log(feePaid, lesson, pta);

        if (parseInt(feePaid) > parseInt(les)) {
          // console.log("less than lesson");
          feePaid -= les;
        } else {
          lesson = 0;
        }

        // console.log(feePaid, lesson, pta);

        return feePaid;
      };
      let tuition = !paymentFor?.toLowerCase()?.startsWith("fees")
        ? 0
        : checkIfTuition(feePaid, lesson, PTA);

      // create a function to insert data into the database
      let fnc = async () => {
        // if key is not epmty
        if (key) {
          // create another inner function to add the data to database
          let innerFnc = async () => {
            db.insert(`${req?.session?.databaseName}_payment_record`, {
              name: name?.toLowerCase(),
              payment_id: paymentId,
              amount_paid: feePaid,
              expected_payment: Number(totalFee),
              student_id: studentId || "",
              balance,
              term: term?.toLowerCase(),
              session: session,
              DOP,
              DOG,
              PTA,
              lesson,
              tuition,
              balance_date: DOB,
              remark: remark?.toLowerCase(),
              class: studentClass?.toLowerCase(),
              keyid: key,
              payment_for: paymentFor?.toLowerCase(),
              payment_method: paymentMethod?.toLowerCase(),
              wallet: defaultWallet?.toLowerCase(),
              accountant: loggedUser?.toLowerCase(),
            })
              .then(async (data) => {
                let feeToWallet;
                if (
                  defaultWallet?.toLowerCase() === "current" &&
                  paymentFor?.toLowerCase()?.startsWith("fees")
                ) {
                  feeToWallet = tuition + lesson;
                } else {
                  feeToWallet = feePaid;
                }
                logToFile(
                  "A payment was made",
                  req?.session?.user?.user + " " + req?.session?.user?.school
                );
                db.setWalletValue(
                  `${req?.session?.databaseName}_settings`,
                  feeToWallet,
                  defaultWallet?.toLowerCase(),
                  "add"
                )
                  .then((resp) => {
                    logToFile(
                      "Money added to wallet",
                      req?.session?.user?.user +
                        " " +
                        req?.session?.user?.school
                    );
                    return res.json({
                      status: true,
                      message: "Record added succesfully",
                      key_id: key,
                    });
                  })
                  .catch((error) => {
                    logToFile(
                      err,
                      req?.session?.user?.user + " " + req.session.user.school
                    );
                    logErr(
                      error,
                      __filename,
                      new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
                    );
                    return res.json({
                      status: false,
                      message: "Couldnt add money to wallet",
                    });
                  });
                try {
                  let [_, walletsArr] = await db.getWalletValue(
                    `${req?.session?.databaseName}_settings`,
                    "current",
                    true
                  );
                  if (walletsArr?.has("pta")) {
                    db.setWalletValue(
                      `${req?.session?.databaseName}_settings`,
                      PTA,
                      "pta",
                      "add"
                    )
                      .then((resp) => {
                        logToFile(
                          "Money added to PTA wallet",
                          req?.session?.user?.user +
                            " " +
                            req.session.user.school
                        );
                      })
                      .catch((error) => {
                        logToFile(
                          err,
                          req?.session?.user?.user +
                            " " +
                            req.session.user.school
                        );
                        logErr(
                          error,
                          __filename,
                          new Error().stack
                            .match(/(:[\d]+)/)[0]
                            .replace(":", "")
                        );
                        return res.json({
                          status: false,
                          message: "Couldnt add money to wallet",
                        });
                      });
                  }
                } catch (error) {
                  logErr(
                    error,
                    __filename,
                    new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
                  );
                }

                // return succesful if inserting to database is succesful
              })
              .catch((err) => {
                logToFile(
                  err,
                  req?.session?.user?.user + " " + req.session.user.school
                );
                logErr(
                  err,
                  __filename,
                  new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
                );
                return res.json({
                  status: false,
                  message: "something went wrong, please try again later",
                });
              });
          };

          // check if key exist already in the database
          db.getByColumnName(
            "keyid",
            key,
            `${req?.session?.databaseName}_payment_record`
          )
            .then((data) => {
              if (data?.length == 0) {
                // if it dosent exist, call the inner function to save the data to the database
                innerFnc();
              } else {
                // if key do exist, set key variable to a new set of key and call the "fnc" function
                key = randomKey() + randomKey();
                fnc();
              }
            })
            .catch((err) => {
              console.log(err);
              return res.json({
                status: false,
                message: "something went wrong, please try again later",
              });
            });
        }
      };

      // call the function "fnc"
      fnc();
    }
  } else {
    // if user not present in the session, return an error response to the frontend

    res.json({
      status: false,
      message: "Not logged in",
    });
  }
};
module.exports = {
  fetchClasses,
  autoCompleteFindName,
  savePayment,
};
