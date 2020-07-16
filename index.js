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
const passport = require("passport")
var fs = require("fs");
const multer = require("multer");
const upload = multer({ dest: __dirname + "/uploads/" });
var dbcredentials;
var cors = require("cors");
var con;

var port = 80;
const session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);

app.use(cors());
dbcredentials = {
  host: "localhost",
  user: "mary",
  port: 3306,
  password: "31547207",
  database: "awsha",


  // Whether or not to automatically check for and clear expired sessions:
  clearExpired: true,
  // How frequently expired sessions will be cleared; milliseconds:
  checkExpirationInterval: 900000,
  // The maximum age of a valid session; milliseconds:
  expiration: 86400000,
  // Whether or not to create the sessions database table, if one does not already exist:
  createDatabaseTable: true,
  // Number of connections when creating a connection pool:
  connectionLimit: 1,
  // Whether or not to end the database connection when the store is closed.
  // The default value of this option depends on whether or not a connection was passed to the constructor.
  // If a connection object is passed to the constructor, the default value for this option is false.
  endConnectionOnClose: true,
  charset: 'utf8mb4_bin',
  schema: {
    tableName: 'sessions',
    columnNames: {
      session_id: 'session_id',
      expires: 'expires',
      data: 'data'
    }
  },
  insecureAuth: true
};


con = mysql.createConnection(dbcredentials); // or mysql.createPool(options);
var sessionStore = new MySQLStore({}/* session store options */, con);


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




/*SON/2019-1-04 11:50 - DEVELOPMENT : Start Common Utilities*/

app.use(require("./routes/menu/ProjectObjectiveRoutes"));
app.use(require("./routes/menu/ProjectsRoutes.js"));
app.use(require("./routes/menu/TeamRoutes.js"));
app.use(require("./routes/menu/CompanyRoutes.js"));
app.use(require("./routes/menu/GenderRoutes.js"));
app.use(require("./routes/menu/PercentageRoutes.js"));
app.use(require("./routes/menu/ObjectivesRoutes.js"));
app.use(require("./routes/menu/ObjectivePercentageRoutes.js"));
app.use(require("./routes/menu/CompanyUserRoutes.js"));
app.use(require("./routes/user_management/RolesRoutes.js"));
app.use(require("./routes/user_management/AccessPrivilegesRoutes.js"));
app.use(require("./routes/user_management/UserRolesRoutes.js"));
app.use(require("./routes/user_management/UserAccessPrivilegesRoutes.js"));

app.use(require("./routes/user_management/UsersRoutes.js"));
app.use(require("./routes/user_management/SystemAdminRoutes.js"));
app.use(require("./routes/user_management/OfficeAdminRoutes.js"));









// access middlewares
// app.use(session({
//   key: 'session_cookie_name',
//   secret: 'session_cookie_secret',
//   store: sessionStore,
//   resave: false,
//   saveUninitialized: false
// }));
//
// // app.use(session({secret: 'root'}));
// var sess;


// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     require("./routes/menu/ProjectObjectiveRoutes")
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });


// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/menu/ProjectsRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./extra_file/TeamMembersRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/menu/TeamRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/menu/CompanyRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

// app.use(
//   function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/menu/UsersRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/menu/GenderRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/menu/PercentageRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/menu/ObjectivesRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/menu/ObjectivePercentageRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/menu/CompanyUserRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });

//
// //user management
// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/users_management/AccessPrivilegesRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });
//
// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/users_management/RolesRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });
//
// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/users_management/UserAccessPrivilegesRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });
//
// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/users_management/UserRolesRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });
//
// app.use(function(req, res, next){
//   sess = req.session;
//   if (sess.UserId){
//     (require("./routes/users_management/UsersRoutes.js"));
//   }else {
//     res.end("access denied")
//   }
//   next()
//
// });
//
//
//
// sessionStore.close();
//
//



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
