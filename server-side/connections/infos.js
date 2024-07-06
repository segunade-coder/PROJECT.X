let production = false;
let database = "ushengin_paymof";
let host = "ushengineering.com";
let user = "ushengin_segun";
let password = "Segunade041@";

if (!production) {
  database = "paymof";
  host = "localhost";
  user = "root";
  password = "";
}

module.exports = {
  database,
  host,
  user,
  password,
  production,
};
