/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the administrator_user_session_activities table's route class.
It is initialized at the "Index.js" and is able to receive
calls from the client and passes the calls down to the 
"AdministratorUserSessionActivitiesController" class
*/

const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const AdministratorUserSessionActivitiesController = require("../../controllers/session_management/AdministratorUserSessionActivitiesController.js");

// Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post("/add_administrator_user_session_activities", urlencodedParser, function(request,
                                                                             response
) {
  var date = new Date();
  date.setHours(date.getHours() + 0);
  var jsonObject_ = {
    AdministratorSessionLogId: request.body.AdministratorSessionLogId,
    AdministratorSessionActivityId: request.body.AdministratorSessionActivityId,
    AdministratorSessionActivityDate: date
  };

  var myPromise = AdministratorUserSessionActivitiesController.insert(jsonObject_);

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

router.post("/get_all_administrator_user_session_activities", urlencodedParser, function(request,
                                                                                 response
) {
  var myPromise = AdministratorUserSessionActivitiesController.selectAll();

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

router.post("/get_specific_administrator_user_session_activities", urlencodedParser,
  function(request, response) {
    var mKey = request.body.column_name;
    //var mValue=parseInt(request.query.search_value, 10);
    var mValue = request.body.search_value;

    var myPromise = AdministratorUserSessionActivitiesController.selectSpecific(
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
  }
);

router.post("/update_administrator_user_session_activities", urlencodedParser, function(request,
                                                                                response
) {
  var date = new Date();
  date.setHours(date.getHours() + 0);
  var jsonObject_ = {
    AdministratorSessionLogId: request.body.AdministratorSessionLogId,
    AdministratorSessionActivityId: request.body.AdministratorSessionActivityId,
    AdministratorSessionActivityDate: date

  };

  var myPromise = AdministratorUserSessionActivitiesController.batchUpdate(jsonObject_);

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

router.post("/update_individual_administrator_user_session_activities", urlencodedParser, function(request, response) {
    var column_name = request.body.ColumnName;
    var value_ = request.body.ColumnValue;
    var date = new Date();
    date.setHours(date.getHours() + 0);
    var jsonObject_ = {


      AdministratorSessionLogId: request.body.AdministratorSessionLogId,
      AdministratorSessionActivityId: request.body.AdministratorSessionActivityId,
      AdministratorSessionActivityDate: date
    };

    var myPromise = AdministratorUserSessionActivitiesController.individual_record_update(
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

router.post("/delete_individual_administrator_user_session_activities", urlencodedParser, function(request, response) {
    var column_name = request.body.column_name;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.search_value;

    var UserIdColumnName = request.body.UserIdColumnName;

    var UserId = request.body.AdministratorId;

    var myPromise = AdministratorUserSessionActivitiesController.delete_user_specic_record(
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

router.post("/get_number_of_administrator_user_session_activities_records", urlencodedParser, function(request, response) {
    var column_name = request.body.column_name;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.search_value;

    var myPromise = AdministratorUserSessionActivitiesController.get_number_of_records(
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

router.post("/administrator_user_session_activities_user_specific_query",
  urlencodedParser,
  function(request, response) {
    var ColumnName = request.body.ColumnName;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.value_;

    var UserIdColumnName = request.body.UserIdColumnName;

    var UserId = request.body.AdministratorId;

    var myPromise = AdministratorUserSessionActivitiesController.user_specific_select_query(
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

module.exports = router;