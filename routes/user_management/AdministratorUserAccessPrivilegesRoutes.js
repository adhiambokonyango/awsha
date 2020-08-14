/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the user_access_privileges table's route class.
It is initialized at the "Index.js" and is able to recieve
calls from the client and passes the calls down to the 
"AdministratorUserAccessPrivilegesController" class
*/

const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const AdministratorUserAccessPrivilegesController = require("../../controllers/user_management/AdministratorUserAccessPrivilegesController.js");

//Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post(
  "/update_individual_administrator_user_access_privileges",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.ColumnName;
    var value_ = request.body.ColumnValue;

    var date = new Date();
    date.setHours(date.getHours() + 0);

    var jsonObject_ = {
      AdministratorPermissionStatus: request.body.AdministratorPermissionStatus
    };

    var myPromise = AdministratorUserAccessPrivilegesController.individualUpdate(
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

  var myPromise = AdministratorUserAccessPrivilegesController.get_specific_records(
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

router.post("/add_user_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var jsonObject_ = {
    AdministratorId: request.body.AdministratorId,
    AdministratorUserRoleId: request.body.AdministratorUserRoleId,
    AdministratorAccessPrivilegeId: request.body.AdministratorAccessPrivilegeId,
    AdministratorPermissionStatus: request.body.AdministratorPermissionStatus
  };

  var myPromise = AdministratorUserAccessPrivilegesController.insert(jsonObject_);

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




router.post("/get_all_user_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var myPromise = AdministratorUserAccessPrivilegesController.selectAll();

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

router.post('/get_administrator_user_privileges_by_full_description',urlencodedParser,function(request,response){



  var myPromise = AdministratorUserAccessPrivilegesController.getAllAdministratorPrivilegesByFullDescription();


  myPromise.then(function(result) {

    var response_object={results:result}
    response.send(response_object);
  }, function(err) {
    response.send("An error occurred");
    console.log(err);
  })

});


router.post("/get_specific_user_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var mKey = request.body.column_name;
  //var mValue=parseInt(request.query.search_value, 10);
  var mValue = request.body.search_value;

  var myPromise = AdministratorUserAccessPrivilegesController.get_specific_records(
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

router.post("/update_user_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var date = new Date();
  date.setHours(date.getHours() + 0);

  var jsonObject_ = {
    AdministratorUserRoleId: request.body.AdministratorUserRoleId,
    AdministratorAccessPrivilegeId: request.body.AdministratorAccessPrivilegeId,
    AdministratorPermissionStatus: request.body.AdministratorPermissionStatus
  };

  var myPromise = AdministratorUserAccessPrivilegesController.batch_update(jsonObject_);

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
  "/delete_individual_user_access_privileges",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.column_name;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.search_value;

    var UserIdColumnName = request.body.UserIdColumnName;

    var UserId = request.body.AdministratorId;

    var myPromise = AdministratorUserAccessPrivilegesController.delete_user_specic_record(
      column_name,
      value_,
      UserIdColumnName,
      UserId
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
  "/get_number_of_user_access_privileges_records",
  urlencodedParser,
  function(request, response) {
    var column_name = request.body.column_name;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.search_value;

    var myPromise = AdministratorUserAccessPrivilegesController.get_number_of_records(
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
  "/user_access_privileges_user_specific_query",
  urlencodedParser,
  function(request, response) {
    var ColumnName = request.body.AdministratorPermissionStatus;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.value_;

    var UserIdColumnName = request.body.UserIdColumnName;

    var UserId = request.body.AdministratorId;

    var myPromise = AdministratorUserAccessPrivilegesController.user_specific_select_query(
      ColumnName,
      value_,
      UserIdColumnName,
      UserId
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

router.post("/get_a_user_access_privileges", urlencodedParser, function(
  request,
  response
) {
  var userRoleId = request.body.AdministratorUserRoleId;

  var myPromise = AdministratorUserAccessPrivilegesController.getAUserAccessPrivileges(
    userRoleId
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


router.post("/get_user_access_privileges_for_particular_role", urlencodedParser, function(
  request,
  response
) {
  var userId = request.body.AdministratorId;
  var roleCode = request.body.AdministratorRoleCode;
  var accessPrivilegeCode = request.body.AdministratorAccessPrivilegeCode;

  var myPromise = AdministratorUserAccessPrivilegesController.getPrivilegesForParticularUserForParticularRole(userId,roleCode,accessPrivilegeCode);

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
