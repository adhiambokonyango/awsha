/*SON/2018-11-06 00:29 - DEVELOPMENT

This is the system's entry point.It creates
the database connection and port binding 
then initializes all the route files.

*/
//require('dotenv').config()
const mysql = require("mysql");
const express = require("express");
const app = express();
const path = require("path");
var fs = require("fs");
const multer = require("multer");
const upload = multer({ dest: __dirname + "/uploads/" });
var dbcredentials;
var cors = require("cors");
var port = 80;

app.use(cors());
dbcredentials = {
  host: "localhost",
  user: "mary",
  password: "31547207",
  database: "awsha",
  insecureAuth: true
};

app.use(express.static("uploads"));

var con;
app.use((req, res, next) => {
  con = mysql.createConnection(dbcredentials);
  con.on("error", err => {
    console.log("db error", err);
    if (err.code === "PROTOCOL_CONNECTION_LOST") {
      console.log(err);
    } else {
      //throw err;
    }
  });

  console.log("Connection established");
  next();
});



app.get("/display_image", (req, res) => {
  //res.sendFile(path.join(__dirname, "./uploads/df37ba09d301ed7e28a5ac7bdbd36a92"));
  var imageID = req.query.imageID;
  res.send('<img src="/' + imageID + '">');
});


app.post("/upload_images", upload.single("file"), function(req, res) {
  var file = __dirname + "/uploads/" + req.file.filename;
  fs.rename(req.file.path, file, function(err) {
    if (err) {
      console.log(err);
      res.send(500);
    } else {
      res.send(req.file.filename);
      console.log(req.file.filename);
    }
  });
});




/*SON/2019-1-04 11:50 - DEVELOPMENT : Start Common Utilities*/


app.use(require("./routes/menu/ProjectObjectiveRoutes"));
app.use(require("./routes/menu/ProjectsRoutes.js"));
app.use(require("./extra_file/TeamMembersRoutes.js"));
app.use(require("./routes/menu/TeamRoutes.js"));
app.use(require("./routes/menu/CompanyRoutes.js"));
app.use(require("./routes/menu/UsersRoutes.js"));
app.use(require("./routes/menu/GenderRoutes.js"));
app.use(require("./routes/menu/PercentageRoutes.js"));
app.use(require("./routes/menu/ObjectivesRoutes.js"));
app.use(require("./routes/menu/ObjectivePercentageRoutes.js"));
app.use(require("./routes/menu/CompanyUserRoutes.js"));

//user management
app.use(require("./routes/users_management/AccessPrivilegesRoutes.js"));
app.use(require("./routes/users_management/RolesRoutes.js"));
app.use(require("./routes/users_management/UserAccessPrivilegesRoutes.js"));
app.use(require("./routes/users_management/UserRolesRoutes.js"));
app.use(require("./routes/users_management/UsersRoutes.js"));



/*SON/2019-1-04 11:50 - DEVELOPMENT : End Common Utilities*/


app.use(function(err, req, res, next) {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});



const server = app.listen(5000, () => {
  const host = server.address().address;
  const port = server.address().port;

  console.log(`Service listening at port ${port}`);
});
