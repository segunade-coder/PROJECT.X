const mysql = require("mysql");
require("./prototypes");
class dbQueries {
  constructor(connection) {
    this.connection = connection;
  }
  createTable = (table, ...params) => {
    return new Promise((resolve, reject) => {
      let query_string = ``;
      let columnNames = [];
      let dataType = [];
      let qry = "";
      params.forEach((param) => {
        columnNames.push(param.columnName);
        dataType.push(param.dataType);
      });
      for (let i = 0; i < columnNames.length; i++) {
        qry += `${columnNames[i]} ${dataType[i].toUpperCase()}${
          dataType[i].toUpperCase() === "VARCHAR" ? "(255)" : "(11)"
        } NOT NULL ${i === columnNames.length - 1 ? "" : ","} `;
      }
      // this.connection.query(`SELECT * FROM ${table}`, (err, data ))
      query_string = `CREATE TABLE ${table} (id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, ${qry}, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)`;
      this.connection.query(query_string, (err, data) => {
        if (err) {
          reject(err);
          return;
        }
        resolve(data);
      });
    });
  };
  query = (query) => {
    return new Promise((resolve, reject) => {
      this.connection.query(query, (err, data) => {
        err ? reject(err.sqlMessage) : resolve(data);
      });
    });
  };
  returnConnection = () => {
    return this.connection;
  };
  getAll = (table) => {
    return new Promise((resolve, reject) => {
      let sql = "SELECT * FROM " + table;
      this.connection.query(sql, (err, data) => {
        err ? reject(err.sqlMessage) : resolve(data);
      });
    });
  };
  getById = (id, table) => {
    if (typeof id !== "number" && typeof table !== "string") {
      return new Promise((resolve, reject) =>
        reject(
          new SyntaxError(
            "Id be of type 'number' and table name must be type 'string'"
          )
        )
      );
    }
    return new Promise((resolve, reject) => {
      let sql = "SELECT * FROM " + table + " WHERE id = ?";
      this.connection.query(sql, [id], (err, data) => {
        err ? reject(err.sqlMessage) : resolve(data);
      });
    });
  };
  getByColumnName = (columnName, value, table) => {
    if (typeof columnName && typeof value && typeof table !== "string") {
      return new Promise((resolve, reject) =>
        reject(new SyntaxError("Must be of type 'string'"))
      );
    }
    return new Promise((resolve, reject) => {
      let sql = `SELECT * FROM ${table} WHERE ${columnName} = ?`;
      this.connection.query(sql, [value], (err, data) => {
        err ? reject(err.sqlMessage) : resolve(data);
      });
    });
  };
  updateByColumnName = (columnName, value, table) => {
    if (typeof columnName && typeof value && typeof table !== "string") {
      return new Promise((resolve, reject) =>
        reject(new SyntaxError("Must be of type 'string'"))
      );
    }
    return new Promise((resolve, reject) => {
      let sql = `UPDATE ${table} SET ${columnName} = ? WHERE id = 1`;
      this.connection.query(sql, [value], (err, data) => {
        err ? reject(err.sqlMessage) : resolve(data);
      });
    });
  };
  delete = (table, id) => {
    if (typeof id !== "number" && table !== "string") {
      return new Promise((resolve, reject) =>
        reject(new SyntaxError("Must be of type 'string'"))
      );
    }
    return new Promise((resolve, reject) => {
      let sql = `DELETE FROM ${table} WHERE id = ?`;
      this.connection.query(sql, [id], (err, data) => {
        err ? reject(err.sqlMessage) : resolve(data);
      });
    });
  };
  insert = (table, values) => {
    if (typeof table !== "string" && typeof values !== "object") {
      return new Promise((resolve, reject) =>
        reject(new SyntaxError("Must be of type 'string'"))
      );
    }
    return new Promise((resolve, reject) => {
      let keyArray = [];
      let valueArray = [];
      let sqlInject = [];
      for (let key in values) {
        keyArray.push(key);
        valueArray.push(`${mysql.escape(values[key])}`);
        sqlInject.push("?");
      }
      let sql = `INSERT INTO ${table} (${keyArray.join(
        ", "
      )}) VALUES(${valueArray.join(", ")})`;
      this.connection.query(sql, (err, data) => {
        err ? reject(err) : resolve(data);
      });
    });
  };
  getWalletValue = (table, wallet, returnWallets = false) => {
    if (typeof table && typeof wallet !== "string") {
      return new Promise((resolve, reject) =>
        reject(new SyntaxError("Invalid data type"))
      );
    }
    return new Promise((resolve, reject) => {
      let sql = `SELECT wallets FROM ${table} WHERE id = ?`;
      this.connection.query(sql, [1], (err, data) => {
        let wallets = new Map(JSON.parse(data[0].wallets));
        if (!wallets.has(wallet)) reject("Wallet does not exist");
        let selectedWallet = wallets.get(wallet);
        err
          ? reject(err.sqlMessage)
          : returnWallets === false
          ? resolve(selectedWallet)
          : resolve([selectedWallet, wallets]);
      });
    });
  };
  setWalletValue = (
    table,
    valueToAdd = "0",
    wallet = "current",
    operation = "add"
  ) => {
    if (
      typeof table &&
      typeof wallet !== "string" &&
      typeof valueToAdd !== "number"
    ) {
      return new Promise((resolve, reject) =>
        reject(new SyntaxError("Invalid data type"))
      );
    }
    return new Promise((resolve, reject) => {
      // console.log(table, wallet, valueToAdd);
      let sql = `SELECT wallets FROM ${table} WHERE id = ?`;
      this.connection.query(sql, [1], (err, data) => {
        err && reject(err.sqlMessage);
        let wallets = new Map(JSON.parse(data[0].wallets));
        if (!wallets.has(wallet)) reject("Wallet does not exist");
        let selectedWallet = wallets.get(wallet);
        let newWalletAmount =
          operation === "add"
            ? Number(parseFloat(selectedWallet)) +
              Number(parseFloat(valueToAdd))
            : Number(parseFloat(selectedWallet)) -
              Number(parseFloat(valueToAdd));
        wallets.set(wallet, newWalletAmount);
        let newWallets = JSON.stringify([...wallets]);
        sql = `UPDATE ${table} SET wallets = ?`;
        this.connection.query(sql, [newWallets], (err2, data2) => {
          err2 ? reject(err2.sqlMessage) : resolve(data2);
        });
      });
    });
  };
  transferFunds = async (table, from, to, amount) => {
    if (
      typeof table &&
      typeof from &&
      typeof to !== "string" &&
      typeof amount !== "number"
    ) {
      return new Promise((resolve, reject) =>
        reject(new SyntaxError("Invalid data type"))
      );
    }
    let fromAmount = await this.getWalletValue(table, from);
    let [toAmount, wallets] = await this.getWalletValue(table, to, true);
    return new Promise((resolve, reject) => {
      if (fromAmount >= amount && fromAmount !== 0) {
        fromAmount =
          Number(parseFloat(fromAmount)) - Number(parseFloat(amount));
        toAmount += amount;
        wallets.set(from, fromAmount);
        wallets.set(to, Number(toAmount));
        let newWallets = JSON.stringify([...wallets]);
        let sql = `UPDATE ${table} SET wallets = ?`;
        this.connection.query(sql, [newWallets], (err, data) => {
          err ? reject(err.sqlMessage) : resolve(data);
        });
      } else reject("Wallet balance too small");
    });
  };
}
module.exports = dbQueries;
