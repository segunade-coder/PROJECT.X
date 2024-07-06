// require important modules
const path = require("path");
const express = require("express");
const app = express(); // server module
const conn = require("./connections/conn");
const session = require("express-session");
const server = require("http").createServer(app);
const chalk = require("chalk");
const helmet = require("helmet");
const compression = require("compression");
let WebSok = require("./connections/webSok");
const MysqlStore = require("express-mysql-session")(session);
const cors = require("cors");
const PORT = process.env.PORT || 5000;
const {
  host,
  user,
  password,
  database,
  production,
} = require("./connections/infos");
const sessionStore = new MysqlStore({
  host,
  user,
  password,
  database,
  clearExpired: true,
  checkExpirationInterval: 900000,
  expiration: 86400000 * 20,
  createDatabaseTable: true,
  connectionLimit: 1,
  endconnectionOnClose: true,
  charset: "utf8mb4_bin",
  schema: {
    tableName: "sessions",
    columnNames: {
      session_id: "session_id",
      expires: "expires",
      data: "data",
    },
  },
});
const regRouter = require("./Routers/regRouter");
const loginRouter = require("./Routers/loginRouter");
const mainRouter = require("./Routers/mainRouter");
const logToFile = require("./connections/logToFile");
const customLogin = require("./Controllers/customLogin");
// url module
let origins = [];
if (!production) {
  origins = [
    "http://localhost:3000",
    "http://localhost:5000",
    "http://localhost:5173",
    "http://localhost:4173",
    "http://192.168.137.8:5173",
    "http://192.168.137.8:4173",
    "http://192.168.137.8:5000",
  ];
} else {
  origins = ["https://paymof.onrender.com/", "http://paymof.ushmoney.net"];
}

const io = require("socket.io")(server, {
  cors: {
    origin: origins,
  },
});

app.set("trust proxy", 1);
app.use(compression());
app.use(helmet());
// if (production) {
app.use(express.static(path.resolve(__dirname, "./dist")));
// }
app.use(
  cors({
    origin: origins,
    credentials: true,
  })
);
if (!production) {
  app.use(
    session({
      resave: false,
      saveUninitialized: false,
      secret: "This_it_secret_$PVSG@1ZsF9l_",
      key: "paymof",
      store: sessionStore,
      cookie: {
        // httpOnly: true,
        // maxAge: 20 * 24 * 60 * 60 * 1000,
        resave: false,
        sameSite: "lax",
        // sameSite: "none",
        // secure: true,
      },
    })
  );
} else {
  app.use(
    session({
      resave: false,
      saveUninitialized: false,
      secret: "This_it_secret_$PVSG@1ZsF9l_",
      key: "paymof",
      store: sessionStore,
      cookie: {
        httpOnly: true,
        // maxAge: 20 * 24 * 60 * 60 * 1000,
        resave: false,
        // sameSite: "lax",
        sameSite: "none",
        secure: true,
      },
    })
  );
}
WebSok(io, conn);

app.use(express.json());
app.use("/reg", regRouter);
app.use("/login", loginRouter);
app.use("/main", mainRouter);
app.get("/custom-login", customLogin);
app.get("/logout", (req, res) => {
  let user = req?.session?.user?.user;
  req.session.destroy((err) => {
    if (err) {
      return console.error(err);
    }
    logToFile("The session has been destroyed!", user);
    return res.json({
      status: true,
      logout: true,
    });
  });
});

if (production) {
  app.get("*", (req, res) => {
    res.sendFile(path.resolve(__dirname, "./dist", "index.html"));
  });
}

server.listen(PORT, (err) => {
  if (err) {
    logToFile(err);
    throw err;
  }
  console.clear();
  console.log(chalk.green(`compiled successfully!`));
  logToFile("App is live. ✨");
});
