/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the access_privileges table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the 
"AdministratorAccessPrivilegesController" class
*/

const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const AdministratorAccessPrivilegesController = require("../../controllers/user_management/AdministratorAccessPrivilegesController.js");

//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post("/add_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var jsonObject_ = {
    AdministratorAccessPrivilegeDescription: request.body.AdministratorAccessPrivilegeDescription,
    AdministratorAccessPrivilegeCode: request.body.AdministratorAccessPrivilegeCode
  };

  var myPromise = AdministratorAccessPrivilegesController.insert(jsonObject_);

  myPromise.then(
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

router.post("/get_all_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var myPromise = AdministratorAccessPrivilegesController.selectAll();

  myPromise.then(
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


router.post("/update_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var date = new Date();
  date.setHours(date.getHours() + 0);

  var jsonObject_ = {
    AdministratorAccessPrivilegeDescription: request.body.AdministratorAccessPrivilegeDescription,
    AdministratorAccessPrivilegeCode: request.body.AdministratorAccessPrivilegeCode
  };

  var myPromise = AdministratorAccessPrivilegesController.batchUpdate(jsonObject_);

  myPromise.then(
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

router.post("/update_individual_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.ColumnName;
  var value_ = request.body.ColumnValue;

  var date = new Date();
  date.setHours(date.getHours() + 0);

  var jsonObject_ = {
    AdministratorAccessPrivilegeDescription: request.body.AdministratorAccessPrivilegeDescription,
    AdministratorAccessPrivilegeCode: request.body.AdministratorAccessPrivilegeCode
  };

  var myPromise = AdministratorAccessPrivilegesController.individualUpdate(
    column_name,
    value_,
    jsonObject_
  );

  myPromise.then(
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

router.post("/delete_individual_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.search_value;

  var UserIdColumnName = request.body.UserIdColumnName;

  var UserId = request.body.AdministratorId;

  var myPromise = AdministratorAccessPrivilegesController.delete_user_specic_record(
    column_name,
    value_,
    OfficeAdminIdColumnName,
    OfficeAdminId
  );

  myPromise.then(
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
  "/get_number_of_access_privileges_records",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.column_name;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.search_value;

    var myPromise = AdministratorAccessPrivilegesController.get_number_of_records(
      column_name,
      value_
    );

    myPromise.then(
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

router.post(
  "/access_privileges_user_specific_query",
  urlencodedParser,
  function(request, response) {
    var ColumnName = request.body.ColumnName;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.value_;

    var OfficeAdminIdColumnName = request.body.OfficeAdminIdColumnName;

    var OfficeAdminId = request.body.AdministratorId;

    var myPromise = AdministratorAccessPrivilegesController.user_specific_select_query(
      ColumnName,
      value_,
      OfficeAdminIdColumnName,
    OfficeAdminId
    );

    myPromise.then(
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
