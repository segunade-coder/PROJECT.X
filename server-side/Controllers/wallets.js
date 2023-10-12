const conn = require("../connections/conn"); // connection module made to apache server
const dbQueries = require("../connections/mysqlApi"); // mysql api module
const db = new dbQueries(conn);
const logErr = require("../connections/logErrors");
require("../connections/prototypes");
const logToFile = require("../connections/logToFile");

const mysql = require("mysql");

const createWallet = (req, res) => {
  let { walletName } = req.body;
  walletName = walletName.toLowerCase().trim();
  if (walletName === "") {
    res.json({
      status: false,
      message: "You must fill in wallet name",
    });
  } else {
    db.getAll(`${req?.session?.databaseName}_settings`)
      .then((data) => {
        let { wallets } = data[0];
        wallets = new Map(JSON.parse(wallets));
        if (wallets.has(walletName)) {
          res.json({
            status: false,
            message: "Wallet with this name already exist",
          });
        } else {
          wallets.set(walletName, 0);
          let wallet_to_push = JSON.stringify([...wallets]);
          db.query(
            `UPDATE ${
              req?.session?.databaseName
            }_settings SET wallets = ${mysql.escape(
              wallet_to_push
            )} WHERE id = 1`
          )
            .then((data) => {
              logToFile(
                `wallet ${walletName} created`,
                req.session.user.user + " " + req.session.user.school
              );

              res.json({
                status: true,
                message: "Wallet added succesfully!",
              });
            })
            .catch((error) => {
              console.log(error);
              logToFile(
                error,
                req?.session?.user?.user + " " + req.session.user.school
              );
              return res.json({
                status: false,
                message: "Failed to add wallet '" + addWallet + "'",
              });
            });
        }
      })
      .catch((error) => {
        console.log(error);
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
const switchDefaultWallet = (req, res) => {
  let newDefault = req.body.default;
  newDefault = newDefault.toLowerCase().trim();
  if (newDefault === "") {
    return res.json({
      status: false,
      message: "Wallet name is required",
    });
  } else {
    db.query(
      `UPDATE ${
        req?.session?.databaseName
      }_settings SET default_wallets = ${mysql.escape(newDefault)} WHERE id = 1`
    )
      .then((data) => {
        logToFile(
          "Default wallet was switched",
          req.session.user.user + " " + req.session.user.school
        );

        res.json({
          status: true,
          message: "saved succesfully!",
        });
      })
      .catch((error) => {
        console.log(error);
        logToFile(
          error,
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: false,
          message: "Failed to change default",
        });
      });
  }
};
const transferFunds = (req, res) => {
  let { from, to, amount } = req.body;

  if (from !== "" && to !== "" && amount !== "") {
    if (from === to) {
      return res.json({
        status: false,
        message: "Cannot transfer to same account",
      });
    }
    db.transferFunds(`${req?.session?.databaseName}_settings`, from, to, amount)
      .then((data) => {
        logToFile(
          "Funds was transferred",
          req.session.user.user + " " + req.session.user.school
        );
        res.json({
          status: true,
          message: "Transfer succesful",
        });
      })
      .catch((error) => {
        console.log(error);
        logToFile(
          error,
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: false,
          message: "Failed to transfer",
        });
      });
  }
};
const makeExpenses = async (req, res) => {
  let { amount, description, from, user } = req.body;
  if (amount <= 0 || description.trim() === "" || from === "" || user === "") {
    return res.json({
      status: false,
      message: "Fill in required fields",
    });
  } else {
    if (amount <= 9) {
      return res.json({
        status: false,
        message: "Amount too small",
      });
    } else {
      let amount_before;
      try {
        amount_before = await db.getWalletValue(
          `${req?.session?.databaseName}_settings`,
          from,
          false
        );
      } catch (error) {
        console.log(error);
        logToFile(
          error,
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: false,
          message: "Failed to add expenses",
        });
      }
      db.setWalletValue(
        `${req?.session?.databaseName}_settings`,
        amount,
        from,
        "minus"
      )
        .then(async (data) => {
          let amount_after;
          try {
            amount_after = await db.getWalletValue(
              `${req?.session?.databaseName}_settings`,
              from,
              false
            );
          } catch (error) {
            console.log(error);
            logToFile(
              error,
              req?.session?.user?.user + " " + req.session.user.school
            );
            return res.json({
              status: false,
              message: "Failed to add expenses",
            });
          }
          db.insert(`${req?.session?.databaseName}_expenses`, {
            amount,
            description,
            accountant: user,
            wallet: from,
            amount_before,
            amount_after,
          })
            .then((data) => {
              logToFile(
                "Expenses were added",
                req.session.user.user + " " + req.session.user.school
              );

              res.json({
                status: true,
                message: "Operation Succesful",
              });
            })
            .catch((error) => {
              console.log(error);
              logToFile(
                error,
                req?.session?.user?.user + " " + req.session.user.school
              );
              return res.json({
                status: false,
                message: "Failed",
              });
            });
        })
        .catch((error) => {
          console.log(error);
          logToFile(
            error,
            req?.session?.user?.user + " " + req.session.user.school
          );
          return res.json({
            status: false,
            message: "Failed to add expenses",
          });
        });
    }
  }
};
const createChart = async (req, res) => {
  let { chartWallet, option } = req.body;
  let walletAmount = [{ walletAmount: 0 }];
  try {
    if (option === "total amount") {
      walletAmount = await db.query(
        `SELECT SUM(amount_paid) AS walletAmount, SUM(lesson) AS lesson, SUM(PTA) AS pta, COUNT(lesson) FROM ${
          req?.session?.databaseName
        }_payment_record WHERE wallet = ${mysql.escape(chartWallet)}`
      );
    } else if (option === "current amount") {
      walletAmount[0].walletAmount = await db.getWalletValue(
        `${req?.session?.databaseName}_settings`,
        chartWallet,
        false
      );
    }

    // console.log(walletAmount);
    db.query(
      `SELECT SUM(amount) AS expenses FROM ${
        req?.session?.databaseName
      }_expenses WHERE wallet = ${mysql.escape(chartWallet)}`
    )
      .then((data) => {
        if (walletAmount[0].pta !== undefined) {
          let sub = Number(walletAmount[0].pta);
          let NewWalletAmount =
            Number(walletAmount[0].walletAmount) - Number(sub);
          res.json({
            status: true,
            income: NewWalletAmount || 0,
            expenses: data[0].expenses || 0,
            profit: Number(NewWalletAmount) - Number(data[0].expenses) || 0,
          });
        } else {
          res.json({
            status: true,
            income: walletAmount[0].walletAmount || 0,
            expenses: data[0].expenses || 0,
            profit: Number(walletAmount) - Number(data[0].expenses) || 0,
          });
        }
      })
      .catch((error) => {
        console.log(error);
        logToFile(
          error,
          req?.session?.user?.user + " " + req.session.user.school
        );
        return res.json({
          status: false,
          message: "Failed to add expenses",
        });
      });
  } catch (error) {
    console.log(error);
    logToFile(error, req?.session?.user?.user + " " + req.session.user.school);
    return res.json({
      status: false,
      message: "Failed to add expenses",
    });
  }
};

const getExpenseHistory = async (req, res) => {
  try {
    let { wallet } = req.query;
    if (wallet !== "") {
      let data = await db.query(
        `SELECT * FROM ${
          req?.session?.databaseName
        }_expenses WHERE wallet = ${mysql.escape(wallet)} ORDER BY id DESC`
      );
      return res.json({
        status: true,
        message: data,
      });
    }
  } catch (error) {
    console.log(error);
    logToFile(error, req?.session?.user?.user + " " + req.session.user.school);
    return res.json({
      status: false,
      message: "Failed to add expenses",
    });
  }
};

module.exports = {
  createWallet,
  switchDefaultWallet,
  transferFunds,
  makeExpenses,
  createChart,
  getExpenseHistory,
};
