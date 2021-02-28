/*SON/2018-11-06 00:29 - DEVELOPMENT

This is the system's entry point.It creates
the database connection and port binding
then initializes all the route files.

*/
//require('dotenv').config()
const mysql = require("mysql");
const express = require("express");
const app = express();

var fs = require("fs");
const multer = require("multer");
const upload = multer({ dest: __dirname + "/uploads/" });
var dbcredentials;
var cors = require("cors");
var con;
const pdf = require('html-pdf');
const pdfTemplate = require('./documents');

var port = 80;

app.use(cors());
dbcredentials = {
  host: "localhost",
  user: "mary",
  port: 3306,
  password: "31547207",
  database: "awsha",
  insecureAuth: true
};

app.use(express.static("uploads"));

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

app.post('/create-pdf', (req, res) => {
  pdf.create(pdfTemplate(req.body), {}).toFile('result.pdf', (err) => {
    if(err) {
      res.send(Promise.reject());
    }

    res.send(Promise.resolve());
  });
});

app.get('/fetch-pdf', (req, res) => {
  res.sendFile(`${__dirname}/result.pdf`)
})


/*SON/2019-1-04 11:50 - DEVELOPMENT : Start Common Utilities*/


 app.use(require("./routes/menu/TeamRoutes.js"));
 app.use(require("./routes/menu/TeamLeadersRoutes"));
 app.use(require("./routes/menu/ObjectivesRoutes.js"));
 app.use(require("./routes/menu/TeamMemberRoutes"));

app.use(require("./routes/menu/ProjectsRoutes.js"));
app.use(require("./routes/menu/BranchActivationRoutes.js"));
app.use(require("./routes/menu/BranchRoutes.js"));
app.use(require("./routes/menu/GenderRoutes.js"));
app.use(require("./routes/menu/BranchProjectsRoutes"));

app.use(require("./routes/user_management/RolesRoutes.js"));
app.use(require("./routes/user_management/AccessPrivilegesRoutes.js"));
app.use(require("./routes/user_management/UserRolesRoutes.js"));
app.use(require("./routes/user_management/UserAccessPrivilegesRoutes.js"));
app.use(require("./routes/user_management/UsersRoutes.js"));

app.use(require("./routes/user_management/SystemAdminRolesRoutes.js"));
app.use(require("./routes/user_management/SystemAdminAccessPrivilegesRoutes.js"));
app.use(require("./routes/user_management/AdminUserRolesRoutes.js"));
app.use(require("./routes/user_management/AdminUserAccessPrivilegesRoutes.js"));
app.use(require("./routes/user_management/SystemAdminRoutes.js"));

app.use(require("./routes/user_management/AdministratorUserRolesRoutes.js"));
app.use(require("./routes/user_management/AdministratorUserAccessPrivilegesRoutes.js"));
app.use(require("./routes/user_management/AdministratorRolesRoutes.js"));
app.use(require("./routes/user_management/AdministratorAccessPrivilegesRoutes.js"));
app.use(require("./routes/user_management/AdministratorRoutes.js"));

app.use(require("./routes/session_management/SessionActivitiesRoutes.js"));
app.use(require("./routes/session_management/SessionLogsRoutes.js"));
app.use(require("./routes/session_management/UserSessionActivitiesRoutes.js"));

app.use(require("./routes/session_management/AdminSessionLogsRoutes.js"));
app.use(require("./routes/session_management/AdminSessionActivitiesRoutes.js"));
app.use(require("./routes/session_management/AdminUserSessionActivitiesRoutes.js"));

app.use(require("./routes/session_management/AdministratorSessionActivitiesRoutes.js"));
app.use(require("./routes/session_management/AdministratorSessionLogsRoutes.js"));
app.use(require("./routes/session_management/AdministratorUserSessionActivitiesRoutes.js"));

app.use(require("./routes/products/ProductRoutes.js"));
app.use(require("./routes/products/CatalogueItemsRoutes.js"));

app.use(require("./routes/lots/LotsRoutes.js"));
app.use(require("./routes/terms_conditions/TermsAndConditionsRoutes.js"));




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
