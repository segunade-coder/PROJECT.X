// import cron module for scheduling task to run on a specific time
const cron = require("node-cron");
const logToFile = require("../connections/logToFile");
// set variable of crodrun to '0'. specifies the amount of time the task has run
let crodrun = 0;
let keyidArr = [];
let formatTimeAgo = (date) => {
  let formatter = new Intl.RelativeTimeFormat(undefined, {
    numeric: "auto",
  });
  const DIVISION = [
    { amount: 60, name: "seconds" },
    { amount: 60, name: "minutes" },
    { amount: 24, name: "hours" },
    { amount: 7, name: "days" },
    { amount: 4.34524, name: "weeks" },
    { amount: 12, name: "months" },
    { amount: Number.POSITIVE_INFINITY, name: "years" },
  ];

  let duration = (date - new Date()) / 1000;
  for (let i = 0; i < DIVISION.length; i++) {
    const division = DIVISION[i];
    if (Math.abs(duration) < division.amount) {
      return formatter.format(Math.round(duration), division.name);
    }
    duration /= division.amount;
  }
};
// create a function scheduler that takes the custom mysql api module and request object as parameters
let scheduler = (db, req) => {
  // array for the months of a year

  // schedule task to run every 3 hours of every day
  cron.schedule("0 0 */3 * * *", () => {
    // chech the variable crodrun to know the amount of time the task has run
    if (crodrun === 0) {
      logToFile("checking for expired balance date");

      // if crodrun = "0", increment crodrun by 1. to make sure function runs just once.
      ++crodrun;

      // create a function to check expired dates of payment
      let checkFnc = () => {
        // fetch already existing notification and filter new notification to avoid duplicate notification
        if (req.session.databaseName) {
          db.query(
            `SELECT payment_id FROM ${req?.session?.databaseName}_notifications`
          )
            .then((noti) => {
              noti.forEach((element) => {
                // extract the payment id from the array returned from the database query
                keyidArr.push(element.payment_id);
              });
            })
            .catch((err) => console.log(err));
          // fetch all payment that have a balance of
          db.query(
            `SELECT name, balance_date, keyid, class, balance FROM ${req?.session?.databaseName}_payment_record WHERE balance_date < CURRENT_TIMESTAMP AND balance > 0 IN (SELECT MAX(id) FROM ${req?.session?.databaseName}_payment_record GROUP BY keyid) GROUP BY keyid`
          )
            .then((users) => {
              // create inner function to create notification
              let insertFnc = (arr) => {
                // loop through and filter out notification that already exist.
                arr.forEach((user) => {
                  if (keyidArr.includes(user.keyid)) {
                    logToFile(`user ${user.name} exist`);
                  } else {
                    logToFile("create notification text");
                    let title = `balance date expired.`;
                    let text = `the balance date of ${user.name} in ${
                      user.class
                    } expired ${
                      user.balance_date
                        ? formatTimeAgo(new Date(user.balance_date))
                        : ""
                    }. The balance is: ${Number(
                      user?.balance
                    ).toLocaleString()}`;
                    payment_id = user.keyid;
                    if (title == "" || text == "" || payment_id == "") {
                      return;
                    } else {
                      // insert notifications into the database.
                      db.insert(`${req?.session?.databaseName}_notifications`, {
                        title: title,
                        text: text,
                        payment_id: payment_id,
                      })
                        .then((data) => {
                          logToFile(
                            "Fetch expired Balance Date Succesful",
                            req.session.user.school + req.session?.user?.user
                          );

                          checkFnc();
                        })
                        .catch((err) => {
                          console.log(err);
                          logToFile(
                            err,
                            req?.session?.user?.user +
                              " " +
                              req.session.user.school
                          );
                        });
                    }
                  }
                });
              };

              insertFnc(users);
            })
            .catch((err) => console.log(err));
        } else {
          logToFile("Not logged in");
        }
      };

      // call checkFnc function
      checkFnc();
    }
  });
};

module.exports = scheduler;
