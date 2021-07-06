/*SON/2018-11-06 00:29 - DEVELOPMENT

This is the system's entry point.It creates
the database connection and port binding
then initializes all the route files.

*/
//require('dotenv').config()
const express = require("express");
const app = express();

var fs = require("fs");
const multer = require("multer");
const upload = multer({ dest: __dirname + "/uploads/" });

const pdf = require('html-pdf');
const pdfTemplate = require('./documents');

var jwt = require('express-jwt');
var jwks = require('jwks-rsa');




app.use(express.static("uploads"));

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


app.use(require("./routes/stock/StocksRoutes.js"));


var jwtCheck = jwt({
  secret: jwks.expressJwtSecret({
    cache: true,
    rateLimit: true,
    jwksRequestsPerMinute: 5,
    jwksUri: 'https://dev-9detlok0.us.auth0.com/.well-known/jwks.json'
  }),
  audience: 'http://127.0.0.1:5000',
  issuer: 'https://dev-9detlok0.us.auth0.com/',
  algorithms: ['RS256']
});

//app.use(jwtCheck);
// {
//   'user-agent': 'PostmanRuntime/7.26.8',
//   accept: '*/*',
//   'postman-token': '68758a76-fb0e-4d0e-880c-936512aa975b',
//   host: 'localhost:5000',
//   'accept-encoding': 'gzip, deflate, br',
//   connection: 'keep-alive'
// }
app.get('/authorized', function (req, res) {
  res.send('Secured Resource');
});



// var options = {
//   method: 'POST',
//   url: 'https://dev-9detlok0.us.auth0.com/oauth/token',
//   headers: { 'content-type': 'application/json' },
//   body: '{"client_id":"xe5P3HoPUiapkic2sUZerCwwZ5b1hAD1","client_secret":"61yhBs6QRsVaKKUsanqZaX05IpqeOr_3Ed9365FMPuWZlKihWpnaIXU5lQtCi9Hy","audience":"http://127.0.0.1:5000","grant_type":"client_credentials"}'
// };
//
// request(options, function (error, response, body) {
//   if (error) throw new Error(error);
//
//   console.log(body);
// });


/*SON/2019-1-04 11:50 - DEVELOPMENT : End Common Utilities*/


app.use(function(err, req, res, next) {
  console.error(err.stack);
  res.status(500).send("Something broke!");
});

// "192.168.0.169"
// "192.168.137.240"
const server = app.listen(5000, "192.168.0.169", () => {
  const host = server.address().address;
  const port = server.address().port;

  console.log(`Service listening at port ${port}`);
});
