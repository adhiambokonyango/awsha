/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the user_roles table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the 
"AssignedSystemAdminRolesController" class
*/

const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const AssignedSystemAdminRolesController = require("../../controllers/user_management/AssignedSystemAdminRolesController.js");

//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post("/add_assigned_system_admin_roles", urlencodedParser, function(request, response) {
  var jsonObject_ = {
    SystemAdminId: request.body.SystemAdminId,
    RoleId: request.body.RoleId,
    ConfirmationStatus: request.body.ConfirmationStatus
  };

  var myPromise = AssignedSystemAdminRolesController.insert(jsonObject_);

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

router.post("/get_all_assigned_system_admin_roles", urlencodedParser, function(
  request,
  response
) {
  var myPromise = AssignedSystemAdminRolesController.get_all_records();

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

router.post("/get_specific_assigned_system_admin_roles", urlencodedParser, function(
  request,
  response
) {
  var mKey = request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue = request.body.search_value;

  var myPromise = AssignedSystemAdminRolesController.get_specific_records(mKey, mValue);

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

router.post("/update_assigned_system_admin_roles", urlencodedParser, function(
  request,
  response
) {
  var jsonObject_ = {
    UserId: request.body.SystemAdminId,
    RoleId: request.body.RoleId,
    ConfirmationStatus: request.body.ConfirmationStatus
  };

  var myPromise = AssignedSystemAdminRolesController.batch_update(jsonObject_);

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

router.post("/update_individual_assigned_system_admin_roles", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.ColumnName;
  var value_ = request.body.ColumnValue;

  var jsonObject_ = {
    ConfirmationStatus: request.body.ConfirmationStatus
  };

  var myPromise = AssignedSystemAdminRolesController.individual_record_update(
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

router.post("/delete_individual_assigned_system_admin_roles", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.search_value;

  var SystemAdminIdColumnName = request.body.SystemAdminIdColumnName;

  var SystemAdminId = request.body.SystemAdminId;

  var myPromise = AssignedSystemAdminRolesController.delete_user_specic_record(
    column_name,
    value_,
    SystemAdminIdColumnName,
    SystemAdminId
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

router.post("/get_number_of_assigned_system_admin_roles_records", urlencodedParser, function(
  request,
  response
) {
  var column_name = request.body.column_name;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.search_value;

  var myPromise = AssignedSystemAdminRolesController.get_number_of_records(
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
});

router.post("/user_roles_assigned_system_admin_specific_query", urlencodedParser, function(
  request,
  response
) {
  var ColumnName = request.body.ColumnName;
  //var mValue=parseInt(request.body.search_value, 10);
  var value_ = request.body.value_;

  var SystemAdminIdColumnName = request.body.SystemAdminIdColumnName;

  var SystemAdminId = request.body.SystemAdminId;

  var myPromise = AssignedSystemAdminRolesController.user_specific_select_query(
    ColumnName,
    value_,
    SystemAdminIdColumnName,
    SystemAdminId
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

router.post("/get_a_assigned_system_admin_roles", urlencodedParser, function(request, response) {
  var userId = request.body.SystemAdminRoleId;

  var myPromise = AssignedSystemAdminRolesController.getAUserRoles(userId);

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


router.post("/assigned_system_admin_has_certain_role", urlencodedParser, function(request, response) {
  var userId = request.body.SystemAdminRoleId;
  var roleCode = request.body.RoleCode;

  var myPromise = AssignedSystemAdminRolesController.checkWhetherAUserHasACertainRole(userId,roleCode);

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


router.post("/assigned_system_admin_allowed_login_with_certain_role", urlencodedParser, function(request, response) {
  var userRoleId = request.body.SystemAdminRoleId;

  var myPromise = AssignedSystemAdminRolesController.checkUserAllowedLoginWithCertainRole(userRoleId);

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

module.exports = router;
