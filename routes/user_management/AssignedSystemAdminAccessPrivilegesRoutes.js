/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the user_access_privileges table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the 
"AssignedSystemAdminAccessPrivilegesController" class
*/

const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const AssignedSystemAdminAccessPrivilegesController = require("../../controllers/user_management/AssignedSystemAdminAccessPrivilegesController.js");

//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post(
  "/update_individual_assigned_system_admin_access_privileges",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.ColumnName;
    var value_ = request.body.ColumnValue;

    var date = new Date();
    date.setHours(date.getHours() + 0);

    var jsonObject_ = {
      PermisionStatus: request.body.PermisionStatus
    };

    var myPromise = AssignedSystemAdminAccessPrivilegesController.individualUpdate(
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
  }
);

router.post("/get_specific_privileges", urlencodedParser, function(
  request,
  response
) {
  var mKey = request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue = request.body.search_value;

  var myPromise = AssignedSystemAdminAccessPrivilegesController.get_specific_records(
    mKey,
    mValue
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

router.post("/add_assigned_system_admin_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var jsonObject_ = {
    SystemAdminId: request.body.SystemAdminId,
    SystemAdminRoleId: request.body.SystemAdminRoleId,
    AccessPrivilegeId: request.body.AccessPrivilegeId,
    PermisionStatus: request.body.PermisionStatus
  };

  var myPromise = AssignedSystemAdminAccessPrivilegesController.insert(jsonObject_);

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




router.post("/get_all_assigned_system_admin_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var myPromise = AssignedSystemAdminAccessPrivilegesController.selectAll();

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

router.post("/get_specific_assigned_system_admin_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var mKey = request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue = request.body.search_value;

  var myPromise = AssignedSystemAdminAccessPrivilegesController.get_specific_records(
    mKey,
    mValue
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

router.post("/update_assigned_system_admin_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var date = new Date();
  date.setHours(date.getHours() + 0);

  var jsonObject_ = {
    SystemAdminRoleId: request.body.SystemAdminRoleId,
    AccessPrivilegeId: request.body.AccessPrivilegeId,
    PermisionStatus: request.body.PermisionStatus
  };

  var myPromise = AssignedSystemAdminAccessPrivilegesController.batch_update(jsonObject_);

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
  "/delete_individual_assigned_system_admin_access_privileges",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.column_name;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.search_value;

    var SystemAdminIdColumnName = request.body.SystemAdminIdColumnName;

    var SystemAdminId = request.body.SystemAdminId;

    var myPromise = AssignedSystemAdminAccessPrivilegesController.delete_user_specic_record(
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
  }
);

router.post(
  "/get_number_of_assigned_system_admin_access_privileges_records",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.column_name;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.search_value;

    var myPromise = AssignedSystemAdminAccessPrivilegesController.get_number_of_records(
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
  "/user_access_privileges_assigned_system_admin_specific_query",
  urlencodedParser,
  function(request, response) {
    var ColumnName = request.body.PermisionStatus;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.value_;

    var SystemAdminIdColumnName = request.body.SystemAdminIdColumnName;

    var SystemAdminId = request.body.SystemAdminId;

    var myPromise = AssignedSystemAdminAccessPrivilegesController.user_specific_select_query(
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
  }
);

router.post("/get_a_assigned_system_admin_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var SystemAdminRoleId = request.body.SystemAdminRoleId;

  var myPromise = AssignedSystemAdminAccessPrivilegesController.getAUserAccessPrivileges(
    SystemAdminRoleId
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


router.post("/get_assigned_system_admin_access_privileges_for_particular_role", urlencodedParser, function(
  request,
  response
) {
  var SystemAdminId = request.body.SystemAdminId;
  var roleCode = request.body.roleCode;
  var accessPrivilegeCode = request.body.accessPrivilegeCode;

  var myPromise = AssignedSystemAdminAccessPrivilegesController.getPrivilegesForParticularSystemAdminForParticularRole(SystemAdminId,roleCode,accessPrivilegeCode);

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
