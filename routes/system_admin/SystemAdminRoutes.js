/*SON/2018-11-06 00:29 - DEVELOPMENT

This class is the system_admins table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the
"SystemAdminController" class

*/


const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const SystemAdminController = require("../../controllers/system_admin/SystemAdminController.js");

//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post("/system_admin_registration", urlencodedParser, function(
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
    GenderId: request.body.GenderId,
    AdminNationalId: request.body.AdminNationalId,
    AdminPassword: request.body.AdminPassword,
    RegisteredDate: date
  };

  var mySystemAdminControllerObjectPromise = SystemAdminController.insert_users(
    jsonObject_
  );

  mySystemAdminControllerObjectPromise.then(
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

router.post("/system_admin_login", urlencodedParser, function(
  request,
  response
) {
  var jsonObject_ = {
    AttemptedEmail: request.body.AttemptedEmail,
    AttemptedPassword: request.body.AttemptedPassword
  };

  var mySystemAdminControllerObjectPromise = SystemAdminController.user_login(
    jsonObject_
  );

  mySystemAdminControllerObjectPromise.then(
    function(result) {
      response.send(result);
    },
    function(err) {
      console.log(err);
      response.send("An error occurred");
    }
  );
});

router.post("/get_all_system_admins", urlencodedParser, function(
  request,
  response
) {
  var mySystemAdminControllerObjectPromise = SystemAdminController.get_all_system_admins();

  mySystemAdminControllerObjectPromise.then(
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

router.post("/update_system_admins", urlencodedParser, function(
  request,
  response
) {
  var date = new Date();
  date.setHours(date.getHours() + 3);

  var jsonObject_ = {
    FirstName: request.body.FirstName,
    MiddleName: request.body.MiddleName,
    SurName: request.body.SurName,
    JobRefNo: request.body.JobRefNo,
    DOB: request.body.DOB,
    Gender: request.body.Gender,
    system_adminEmail: request.body.system_adminEmail,
    PhoneNumber: request.body.PhoneNumber,
    PhysicalAddress: request.body.PhysicalAddress,
    WardId: request.body.WardId,
    Password: request.body.Password,
    RegistrationDate: date
  };

  var mySystemAdminControllerObjectPromise = SystemAdminController.batch_system_admins_update(
    jsonObject_
  );

  mySystemAdminControllerObjectPromise.then(
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

router.post("/get_specific_system_admins", urlencodedParser, function(
  request,
  response
) {
  var mKey = request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue = request.body.search_value;

  var mySystemAdminControllerObjectPromise = SystemAdminController.get_specific_system_admins(
    mKey,
    mValue
  );

  mySystemAdminControllerObjectPromise.then(
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

router.post("/update_individual_system_admins", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.ColumnName;
  var value_ = request.body.ColumnValue;

  var date = new Date();
  date.setHours(date.getHours() + 0);

  var jsonObject_ = {
    FirstName: request.body.FirstName,
    MiddleName: request.body.MiddleName,
    SurName: request.body.SurName,
    JobRefNo: request.body.JobRefNo,
    DOB: request.body.DOB,
    Gender: request.body.Gender,
    system_adminEmail: request.body.system_adminEmail,
    PhoneNumber: request.body.PhoneNumber,
    PhysicalAddress: request.body.PhysicalAddress,
    WardId: request.body.WardId,
    Password: request.body.Password,
    RegistrationDate: date
  };

  var mySystemAdminControllerObjectPromise = SystemAdminController.individual_system_admins_update(
    column_name,
    value_,
    jsonObject_
  );

  mySystemAdminControllerObjectPromise.then(
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

router.post("/delete_individual_system_admins", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.search_value;

  var mySystemAdminControllerObjectPromise = SystemAdminController.delete_system_admins_record(
    column_name,
    value_
  );

  mySystemAdminControllerObjectPromise.then(
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

    var mySystemAdminControllerObjectPromise = SystemAdminController.get_staff_members_with_a_specific_quality(
      TableTwo,
      JoiningKey,
      SearchColumn,
      SearchValue
    );

    mySystemAdminControllerObjectPromise.then(
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
