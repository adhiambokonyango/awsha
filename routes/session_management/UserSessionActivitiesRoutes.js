/*SON/2018-11-06 00:29 - DEVELOPMENT
This class is the actual_session_activities table's route class.
It is initialized at the "Index.js" and is able to receive
calls from the client and passes the calls down to the 
"UserSessionActivitiesController" class
*/

const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
var urlencodedParser = bodyParser.urlencoded({ extended: false });
const UserSessionActivitiesController = require("../../controllers/session_management/UserSessionActivitiesController.js");

// Middle ware that is specific to this router
router.use(function timeLog(req, res, next) {
  next();
});

router.post("/add_actual_session_activities", urlencodedParser, function(request,
  response
) {
  var date = new Date();
  date.setHours(date.getHours() + 0);
  var jsonObject_ = {
    SessionLogId: request.body.SessionLogId,
    SessionActivityId: request.body.SessionActivityId,
    SessionActivityDate: date
  };

  var myPromise = UserSessionActivitiesController.insert(jsonObject_);

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

router.post("/get_all_actual_session_activities", urlencodedParser, function(request,
  response
) {
  var myPromise = UserSessionActivitiesController.selectAll();

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

router.post("/get_specific_actual_session_activities", urlencodedParser,
  function(request, response) {
    var mKey = request.body.column_name;
    //var mValue=parseInt(request.query.search_value, 10);
    var mValue = request.body.search_value;

    var myPromise = UserSessionActivitiesController.selectSpecific(
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

router.post("/update_actual_session_activities", urlencodedParser, function(request,
  response
) {
  var date = new Date();
  date.setHours(date.getHours() + 0);
  var jsonObject_ = {
    SessionLogId: request.body.SessionLogId,
    SessionActivityId: request.body.SessionActivityId,
    SessionActivityDate: date

  };

  var myPromise = UserSessionActivitiesController.batchUpdate(jsonObject_);

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

router.post("/update_individual_actual_session_activities", urlencodedParser, function(request, response) {
    var column_name = request.body.ColumnName;
    var value_ = request.body.ColumnValue;
    var date = new Date();
    date.setHours(date.getHours() + 0);
    var jsonObject_ = {


      SessionLogId: request.body.SessionLogId,
      SessionActivityId: request.body.SessionActivityId,
      SessionActivityDate: date

    };

    var myPromise = UserSessionActivitiesController.individual_record_update(
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

router.post("/delete_individual_actual_session_activities", urlencodedParser, function(request, response) {
    var column_name = request.body.column_name;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.search_value;

    var UserIdColumnName = request.body.UserIdColumnName;

    var UserId = request.body.UserId;

    var myPromise = UserSessionActivitiesController.delete_user_specic_record(
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

router.post("/get_number_of_actual_session_activities_records", urlencodedParser, function(request, response) {
    var column_name = request.body.column_name;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.search_value;

    var myPromise = UserSessionActivitiesController.get_number_of_records(
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

router.post("/actual_session_activities_user_specific_query",
  urlencodedParser,
  function(request, response) {
    var ColumnName = request.body.ColumnName;
    //var mValue=parseInt(request.body.search_value, 10);
    var value_ = request.body.value_;

    var UserIdColumnName = request.body.UserIdColumnName;

    var UserId = request.body.UserId;

    var myPromise = UserSessionActivitiesController.user_specific_select_query(
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