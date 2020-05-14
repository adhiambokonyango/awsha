/*SON/2018-11-06 00:29 - DEVELOPMENT

This class is the admins table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"AdminController" class

*/


const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const AdminController = require("../../controllers/menu/AdminController.js");

//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post("/admin_registration", urlencodedParser, function(
  request,
  response
) {

  var date = new Date();
  date.setHours(date.getHours() + 3);
  var jsonObject_ = {
    AdminFirstName: request.body.AdminFirstName,
    AdminMiddleName: request.body.AdminMiddleName,
    AdminSurname: request.body.AdminSurname,
    AdminPhoneNumber: request.body.AdminPhoneNumber,
    AdminEmail: request.body.AdminEmail,
    Gender: request.body.Gender,
    AdminNationalId: request.body.AdminNationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date
  };

  var myAdminControllerObjectPromise = AdminController.insert_users(
    jsonObject_
  );

  myAdminControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      console.log(err);
      response.send("An error occurred");
    }
  );
});

router.get("/admin_registration_form", function(req, res) {
  res.sendFile(__dirname + "/" + "AdminRegistration.html");
});

router.get("/admin_login", function(req, res) {
  res.sendFile(__dirname + "/" + "AdminLogin.html");
});

router.post("/admin_login", urlencodedParser, function(
  request,
  response
) {
  var jsonObject_ = {
    AttemptedEmail: request.body.AttemptedEmail,
    AttemptedPassword: request.body.AttemptedPassword
  };

  var myAdminControllerObjectPromise = AdminController.user_login(
    jsonObject_
  );

  myAdminControllerObjectPromise.then(
    function(result) {
      response.send(result);
    },
    function(err) {
      console.log(err);
      response.send("An error occurred");
    }
  );
});

router.post("/get_all_admin", urlencodedParser, function(
  request,
  response
) {
  var myAdminControllerObjectPromise = AdminController.get_all_admin();

  myAdminControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      console.log(err);
      response.send("An error occurred");
    }
  );
});

router.post("/update_admin", urlencodedParser, function(
  request,
  response
) {
  var date = new Date();
  date.setHours(date.getHours() + 3);

  var jsonObject_ = {
    AdminFirstName: request.body.AdminFirstName,
    AdminMiddleName: request.body.AdminMiddleName,
    AdminSurname: request.body.AdminSurname,
    AdminPhoneNumber: request.body.AdminPhoneNumber,
    AdminEmail: request.body.AdminEmail,
    Gender: request.body.Gender,
    AdminNationalId: request.body.AdminNationalId,
    EncryptedPassword	: request.body.EncryptedPassword	,
    RegisteredDate: date
  };

  var myAdminControllerObjectPromise = AdminController.batch_admins_update(
    jsonObject_
  );

  myAdminControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      response.send("An error occurred");
      console.log(err);
    }
  );
});

router.post("/get_specific_admin", urlencodedParser, function(
  request,
  response
) {
  var mKey = request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue = request.body.search_value;

  var myAdminControllerObjectPromise = AdminController.get_specific_admins(
    mKey,
    mValue
  );

  myAdminControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      response.send("An error occurred");
      console.log(err);
    }
  );
});

router.post("/update_individual_admin", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.ColumnName;
  var value_ = request.body.ColumnValue;

  var date = new Date();
  date.setHours(date.getHours() + 0);

  var jsonObject_ = {
    AdminFirstName: request.body.AdminFirstName,
    AdminMiddleName: request.body.AdminMiddleName,
    AdminSurname: request.body.AdminSurname,
    AdminPhoneNumber: request.body.AdminPhoneNumber,
    AdminEmail: request.body.AdminEmail,
    Gender: request.body.Gender,
    AdminNationalId: request.body.AdminNationalId,
    EncryptedPassword	: request.body.EncryptedPassword,
    RegisteredDate: date
  };

  var myAdminControllerObjectPromise = AdminController.individual_admins_update(
    column_name,
    value_,
    jsonObject_
  );

  myAdminControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      response.send("An error occurred");
      console.log(err);
    }
  );
});

router.post("/delete_individual_admin", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.search_value;

  var myAdminControllerObjectPromise = AdminController.delete_admins_record(
    column_name,
    value_
  );

  myAdminControllerObjectPromise.then(
    function(result) {
      var response_object = { results: result };
      response.send(response_object);
    },
    function(err) {
      response.send("An error occurred");
      console.log(err);
    }
  );
});

router.post(
  "/get_staff_members_with_a_specific_quality",
  urlencodedParser,
  function(request, response) {
    var TableTwo = request.body.TableTwo;

    var JoiningKey = request.body.JoiningKey;

    var SearchColumn = request.body.SearchColumn;

    var SearchValue = request.body.SearchValue;

    var myAdminControllerObjectPromise = AdminController.get_staff_members_with_a_specific_quality(
      TableTwo,
      JoiningKey,
      SearchColumn,
      SearchValue
    );

    myAdminControllerObjectPromise.then(
      function(result) {
        var response_object = { results: result };
        response.send(response_object);
      },
      function(err) {
        response.send("An error occurred");
        console.log(err);
      }
    );
  }
);

module.exports = router;