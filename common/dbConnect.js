var mysql = require("mysql");

const con = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "Mary@31547207",
  database: "awsha",
  insecureAuth: true
});
setInterval(() => {
  con.query("SELECT 1", (err, rows) => {
    if (err) throw err;
  });
}, 1000);


module.exports = con;
