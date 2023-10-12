const mysql = require("mysql");
const logErr = require("./logErrors");
// mysql apache credentials for connnecting to xampp without database
const { host, user, password, database } = require("./infos");
const logToFile = require("./logToFile");
const db_cred = {
  host,
  user,
  password,
  database,
};

// create a database connection with the credentials above
const connection = mysql.createConnection(db_cred);

//connect to the apache server
connection.connect((err) => {
  if (err) {
    logToFile("App started. Error connecting to database", err);
    logErr(
      "Error connecting to apache database",
      __filename,
      new Error().stack.match(/(:[\d]+)/)[0].replace(":", "")
    );
    throw err;
  } else {
    logToFile("App started. Connected to apache server succesfully");
    console.log("connected to apache database...");
  }
});

// export the connection
module.exports = connection;
