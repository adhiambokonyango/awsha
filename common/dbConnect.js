var mysql = require("mysql");

const con = mysql.createPool({
  host: "localhost",
  user: "mary",
  password: "31547207",
  database: "task_schedular",
  insecureAuth: true
});
setInterval(() => {
  con.query("SELECT 1", (err, rows) => {
    if (err) throw err;
  });
}, 1000);


module.exports = con;
